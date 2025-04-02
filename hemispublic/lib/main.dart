import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hemispublic/cubit/university_list_cubit.dart';
import 'package:hemispublic/pages/university-list/university-list.dart';

void main() {
  runApp(const MyApp());
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
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const UniversityListPage(),
      ),
    );
  }
}
