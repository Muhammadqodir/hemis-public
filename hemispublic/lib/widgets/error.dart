import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/utils/themes.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    required this.title,
    this.onRetry,
  });

  final String title;
  final String message;
  final Function? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(message),
          if (onRetry != null)
            CupertinoButton(
              onPressed: () {
                onRetry!();
              },
              color: primaryColor,
              child: const Text("Qayta urinish"),
            ),
        ],
      ),
    );
  }
}
