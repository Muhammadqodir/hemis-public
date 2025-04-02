class ApiResponce<T> {
  bool isSuccess;
  String title;
  String message;
  T? data;

  ApiResponce({
    required this.isSuccess,
    required this.title,
    required this.message,
    this.data,
  });

  ApiResponce.success({
    this.isSuccess = true,
    this.title = "",
    this.message = "",
    required this.data,
  });

  ApiResponce.error({
    this.isSuccess = false,
    required this.title,
    required this.message,
  });
}
