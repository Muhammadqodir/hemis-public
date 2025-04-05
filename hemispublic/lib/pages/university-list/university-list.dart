import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/ratios/partial_ratio.dart';
import 'package:hemispublic/cubit/theme_cubit.dart';
import 'package:hemispublic/cubit/university_list_cubit.dart';
import 'package:hemispublic/layouts/custom-layout.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/pages/dashboard/dashboard.dart';
import 'package:hemispublic/utils/dialogs.dart';
import 'package:hemispublic/utils/themes.dart';
import 'package:hemispublic/widgets/error.dart';
import 'package:hemispublic/widgets/ontapscale.dart';
import 'package:hemispublic/widgets/university-list-item.dart';

class UniversityListPage extends StatefulWidget {
  const UniversityListPage({super.key});

  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {
  List<University> list = [];
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  Timer? _debounce;
  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (value.length >= 2) {
        search(value);
      } else {
        setState(() {
          if (context.read<UniversityListCubit>().state
              is UniversityListLoaded) {
            list = (context.read<UniversityListCubit>().state
                    as UniversityListLoaded)
                .universities;
          }
        });
        scrollToTop();
      }
    });
  }

  void search(String q) {
    if (list.isEmpty) return;
    List<University> res = extractTop<University>(
      query: q,
      choices: list,
      limit: 20,
      ratio: PartialRatio(),
      getter: (obj) => "${getAbbrv(obj.name ?? "undefined")} ${obj.name}",
    ).map((e) => e.choice).toList();
    setState(() {
      list = res;
    });
    scrollToTop();
  }

  String getAbbrv(String name) {
    String res = "";
    for (var element in name.split(" ")) {
      if (element.isNotEmpty) res += element[0];
    }
    return res;
  }

  void scrollToTop() {
    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UniversityListCubit, UniversityListState>(
      listener: (context, state) {
        if (state is UniversityListLoaded) {
          setState(() {
            list = state.universities;
          });
        }
      },
      child: BlocBuilder<UniversityListCubit, UniversityListState>(
        builder: (context, state) {
          if (state is UniversityListLoading) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/logo.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: state.progress,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.progressText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is UniversityListError) {
            return Scaffold(
              body: SafeArea(
                child: CustomErrorWidget(
                  message: state.message,
                  title: state.title,
                  onRetry: () {
                    context.read<UniversityListCubit>().fetchUniversities();
                  },
                ),
              ),
            );
          }
          if (state is UniversityListLoaded) {
            return CustomLayout(
              controller: _controller,
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "eCampus Statistics",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 300,
                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        _onSearchChanged(value);
                      },
                      onSubmitted: (value) {
                        _onSearchChanged(value);
                      },
                      placeholder: "Qidirish",
                      style: Theme.of(context).textTheme.bodyMedium,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                    ),
                  )
                ],
              ),
              child: Column(
                children: list
                    .map(
                      (university) => UniversityListItem(
                        university: university,
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => DashboardPage(
                                university: university,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          }
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("Unknown state"),
              ),
            ),
          );
        },
      ),
    );
  }
}
