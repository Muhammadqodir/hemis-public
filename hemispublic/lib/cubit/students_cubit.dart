import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:hemispublic/api/responce.dart';
import 'package:hemispublic/api/university_api.dart';
import 'package:hemispublic/models/students.dart';
import 'package:hemispublic/models/university.dart';
import 'package:meta/meta.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit() : super(StudentsInitial());

  void fetchStudents(University university) async {
    emit(StudentsLoading(university));
    ApiResponce responce = await UniversityApi(
      university.api_url ?? "undefined",
    ).getStudents();
    if (responce.isSuccess) {
      emit(StudentsLoaded(
        university: university,
        students: responce.data,
      ));
    } else {
      emit(StudentsError(title: responce.title, message: responce.message));
    }
  }
}
