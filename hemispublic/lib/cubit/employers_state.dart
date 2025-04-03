part of 'employers_cubit.dart';

abstract class EmployersState {}

final class EmployersInitial extends EmployersState {}

final class EmployersLoading extends EmployersState {
  final University university;

  EmployersLoading(this.university);
}

final class EmployersError extends EmployersState {
  final String title;
  final String message;

  EmployersError({
    required this.title,
    required this.message,
  });
}

final class EmployersLoaded extends EmployersState {
  final University university;
  final Employers employers;

  EmployersLoaded({
    required this.university,
    required this.employers,
  });
}
