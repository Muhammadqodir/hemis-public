import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.title = "Loading...",
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        const SizedBox(height: 10),
        Text(
          "Loading...",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
