import 'dart:async';

import 'package:flutter/material.dart';

class OnTapScaleAndFade extends StatefulWidget {
  final Widget child;
  final void Function() onTap;
  final double lowerBound;
  const OnTapScaleAndFade({
    super.key,
    required this.child,
    required this.onTap,
    this.lowerBound = 0.85,
  });

  @override
  _OnTapScaleAndFadeState createState() => _OnTapScaleAndFadeState();
}

class _OnTapScaleAndFadeState extends State<OnTapScaleAndFade>
    with TickerProviderStateMixin {
  double squareScaleA = 1;
  late AnimationController _controllerA;
  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: 1.0,
      value: 1,
      duration: const Duration(milliseconds: 50),
    );
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _controllerA.reverse();
        widget.onTap();
      },
      onTapDown: (dp) {
        _controllerA.reverse();
      },
      onTapUp: (dp) {
        Timer(Duration(milliseconds: 50), () {
          if (mounted) _controllerA.fling();
        });
      },
      onTapCancel: () {
        _controllerA.fling();
      },
      child: Transform.scale(
        scale: squareScaleA,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }
}
