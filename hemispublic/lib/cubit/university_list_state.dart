part of 'university_list_cubit.dart';

abstract class UniversityListState {}

final class UniversityListInitial extends UniversityListState {}

final class UniversityListLoading extends UniversityListState {
  double progress = 0.0;
  String progressText = "Loading...";
  UniversityListLoading({
    this.progress = 0.0,
    this.progressText = "Loading...",
  });
}

final class UniversityListLoaded extends UniversityListState {
  final List<University> universities;

  UniversityListLoaded(this.universities);
}

final class UniversityListError extends UniversityListState {
  final String title;
  final String message;

  UniversityListError({
    required this.title,
    required this.message,
  });
}
