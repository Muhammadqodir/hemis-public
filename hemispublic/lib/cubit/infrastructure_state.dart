part of 'infrastructure_cubit.dart';


abstract class InfrastructureState {}

final class InfrastructureInitial extends InfrastructureState {}

final class InfrastructureLoading extends InfrastructureState {
  final University university;

  InfrastructureLoading(this.university);
}

final class InfrastructureError extends InfrastructureState {
  final String title;
  final String message;

  InfrastructureError({
    required this.title,
    required this.message,
  });
}

final class InfrastructureLoaded extends InfrastructureState {
  final University university;
  final Infrastructure infrastructure;

  InfrastructureLoaded({
    required this.university,
    required this.infrastructure,
  });
}
