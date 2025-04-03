import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemispublic/models/university.dart';
import 'package:hemispublic/widgets/custom-list-element.dart';
import 'package:hemispublic/widgets/ontapscale.dart';
import 'package:hemispublic/widgets/web-network-image.dart';

class UniversityListItem extends StatelessWidget {
  const UniversityListItem({
    super.key,
    required this.university,
    required this.onTap,
  });

  final University university;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return CustomListElement(
      onPressed: () {
        onTap();
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: WebNetworkImage(
              url: university.logo ?? "undefined",
              onFail: Image.asset(
                "assets/no-image.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              onLoading: const SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  university.name!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      university.contact ?? "Undefined",
                    ),
                    Text(
                      university.address ?? "Undefined",
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
