import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: CircularProgressIndicator(),
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
