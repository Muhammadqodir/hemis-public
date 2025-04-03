import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hemispublic/widgets/cupertino-ink.dart';
import 'package:hemispublic/widgets/ontapscale.dart';

class CustomListElement extends StatelessWidget {
  const CustomListElement({
    Key? key,
    required this.onPressed,
    required this.child,
    this.enabled = true,
    this.lowerBound = .95,
    this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final double lowerBound;
  final EdgeInsets padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoInkWell(
          onPressed: onPressed,
          child: OnTapScaleAndFade(
            onTap: onPressed!,
            lowerBound: 0.98,
            child: Padding(
              padding: padding,
              child: Opacity(
                opacity: enabled ? 1 : 0.6,
                child: child,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
          ),
          height: 0.6,
        )
      ],
    );
  }
}
