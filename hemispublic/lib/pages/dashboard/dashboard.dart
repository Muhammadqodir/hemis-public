import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemispublic/cubit/employers_cubit.dart';
import 'package:hemispublic/cubit/infrastructure_cubit.dart';
import 'package:hemispublic/cubit/students_cubit.dart';
import 'package:hemispublic/cubit/theme_cubit.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/pages/employers/emploreys-content.dart';
import 'package:hemispublic/pages/structure/structure-content.dart';
import 'package:hemispublic/pages/studnets/students-content.dart';
import 'package:hemispublic/widgets/error.dart';
import 'package:hemispublic/widgets/loading.dart';
import 'package:hemispublic/widgets/ontapscale.dart';
import 'package:hemispublic/widgets/tab_indicator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    required this.university,
  });

  final University university;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late University selectedUniver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedUniver = widget.university;
    tabController = TabController(length: 3, vsync: this);

    context.read<StudentsCubit>().fetchStudents(selectedUniver);
    context.read<EmployersCubit>().fetchStudents(selectedUniver);
    context.read<InfrastructureCubit>().fetchStudents(selectedUniver);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: OnTapScaleAndFade(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                widget.university.logo!,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.university.name!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        actions: [
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
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          overlayColor: MaterialStateColor.transparent,
          tabs: [
            IndicatorTab(
              onTap: () {
                tabController.animateTo(0);
              },
              title: "Talabalar",
              color: Colors.red,
              icon: CupertinoIcons.chart_pie,
            ),
            IndicatorTab(
              onTap: () {
                tabController.animateTo(1);
              },
              title: "Ishchilar(O'qituvchilar)",
              color: Colors.red,
              icon: CupertinoIcons.chart_pie,
            ),
            IndicatorTab(
              onTap: () {
                tabController.animateTo(2);
              },
              title: "Infratuzilma",
              color: Colors.red,
              icon: CupertinoIcons.chart_pie,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            // SizedBox(),
            BlocBuilder<StudentsCubit, StudentsState>(
              builder: (context, state) {
                if (state is StudentsLoading) {
                  return const Center(
                    child: LoadingWidget(
                      title: "Yuklanmoqda...",
                    ),
                  );
                } else if (state is StudentsError) {
                  return CustomErrorWidget(
                    message: state.message,
                    title: state.title,
                    onRetry: () {
                      context
                          .read<StudentsCubit>()
                          .fetchStudents(selectedUniver);
                    },
                  );
                } else if (state is StudentsLoaded) {
                  return StudentsContent(
                    students: state.students,
                    university: state.university,
                  );
                }
                return const Center(
                  child: Text("Undefined state"),
                );
              },
            ),
            BlocBuilder<EmployersCubit, EmployersState>(
              builder: (context, state) {
                if (state is EmployersLoading) {
                  return const Center(
                    child: LoadingWidget(
                      title: "Yuklanmoqda...",
                    ),
                  );
                } else if (state is EmployersError) {
                  return CustomErrorWidget(
                    message: state.message,
                    title: state.title,
                    onRetry: () {
                      context
                          .read<EmployersCubit>()
                          .fetchStudents(selectedUniver);
                    },
                  );
                } else if (state is EmployersLoaded) {
                  return EmployersContent(
                    employers: state.employers,
                    university: state.university,
                  );
                }
                return const Center(
                  child: Text("Undefined state"),
                );
              },
            ),
            BlocBuilder<InfrastructureCubit, InfrastructureState>(
              builder: (context, state) {
                if (state is InfrastructureLoading) {
                  return const Center(
                    child: LoadingWidget(
                      title: "Yuklanmoqda...",
                    ),
                  );
                } else if (state is InfrastructureError) {
                  return CustomErrorWidget(
                    message: state.message,
                    title: state.title,
                    onRetry: () {
                      context
                          .read<InfrastructureCubit>()
                          .fetchStudents(selectedUniver);
                    },
                  );
                } else if (state is InfrastructureLoaded) {
                  return InfrastructureContent(
                    infrastructure: state.infrastructure,
                    university: state.university,
                  );
                }
                return const Center(
                  child: Text("Undefined state"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
