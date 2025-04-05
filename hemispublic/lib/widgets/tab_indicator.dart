// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/widgets/cupertino-ink.dart';

class IndicatorTab extends StatelessWidget {
  const IndicatorTab({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    required this.title,
    this.isScrolable = false,
  });

  final Function() onTap;
  final String title;
  final bool isScrolable;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isScrolable ? null : double.infinity,
      child: CupertinoInkWell(
        onPressed: onTap,
        child: Tab(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
                const SizedBox(
                  width: 4,
                ),
                isScrolable
                    ? Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
