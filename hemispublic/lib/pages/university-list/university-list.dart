import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemispublic/cubit/theme_cubit.dart';
import 'package:hemispublic/cubit/university_list_cubit.dart';
import 'package:hemispublic/layouts/custom-layout.dart';
import 'package:hemispublic/utils/dialogs.dart';
import 'package:hemispublic/utils/themes.dart';
import 'package:hemispublic/widgets/ontapscale.dart';
import 'package:hemispublic/widgets/university-list-item.dart';

class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversityListCubit, UniversityListState>(
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(state.message),
                    CupertinoButton(
                      onPressed: () {
                        context.read<UniversityListCubit>().fetchUniversities();
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UniversityListLoaded) {
          return CustomLayout(
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
                OnTapScaleAndFade(
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: Icon(
                    context.read<ThemeCubit>().state is ThemeDark
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon,
                  ),
                ),
                const SizedBox(width: 12),
                OnTapScaleAndFade(
                  onTap: () {
                    context.read<UniversityListCubit>().fetchUniversities();
                  },
                  child: const Icon(CupertinoIcons.refresh),
                )
              ],
            ),
            child: Column(
              children: state.universities
                  .map(
                    (university) => UniversityListItem(university: university),
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
    );
  }
}
