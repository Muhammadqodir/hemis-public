part of 'students_cubit.dart';

abstract class StudentsState {}

final class StudentsInitial extends StudentsState {}

final class StudentsLoading extends StudentsState {
  final University university;

  StudentsLoading(this.university);
}

final class StudentsError extends StudentsState {
  final String title;
  final String message;

  StudentsError({
    required this.title,
    required this.message,
  });
}

final class StudentsLoaded extends StudentsState {
  final University university;
  final Students students;

  StudentsLoaded({
    required this.university,
    required this.students,
  });
}
