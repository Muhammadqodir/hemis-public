import 'package:flutter/material.dart';
import 'package:hemispublic/widgets/appbar.dart';
import 'package:hemispublic/widgets/listview.dart';

class CustomLayout extends StatefulWidget {
  const CustomLayout({
    super.key,
    required this.child,
    required this.title,
    required this.controller,
  });

  final Widget title;
  final Widget child;
  final ScrollController controller;

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  bool showShadow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 62),
                child: MyListView(
                  controller: widget.controller,
                  onTop: (v) {
                    setState(() {
                      showShadow = !v;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 20,
                      ),
                      child: widget.child,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MyAppBar(
                showShadow: showShadow,
                child: widget.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
