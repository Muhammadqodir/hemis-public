import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.child,
    this.showShadow = false,
  });

  final Widget child;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      // duration: const Duration(milliseconds: 50),
      // curve: Curves.linear,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          if (showShadow)
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4), // changes position of shadow
            ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}
