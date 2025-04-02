import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemispublic/cubit/theme_cubit.dart';
import 'package:hemispublic/cubit/university_list_cubit.dart';
import 'package:hemispublic/pages/university-list/university-list.dart';
import 'package:hemispublic/utils/themes.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UniversityListCubit()..fetchUniversities(),
        ),
      ],
      child: MaterialApp(
        title: 'HEMIS Public Data',
        debugShowCheckedModeBanner: false,
        themeMode: context.watch<ThemeCubit>().state is ThemeLight
            ? ThemeMode.light
            : ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const UniversityListPage(),
      ),
    );
  }
}
