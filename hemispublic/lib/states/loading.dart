abstract class CustomStates {}

class LoadingState extends CustomStates {}

class ErrorState extends CustomStates {
  final String title;
  final String message;
  ErrorState({
    required this.title,
    required this.message,
  });
}

class SuccessState<T> extends CustomStates {
  final T data;
  SuccessState(this.data);
}
