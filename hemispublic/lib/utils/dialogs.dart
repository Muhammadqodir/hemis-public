import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showConfirmDialog(BuildContext context, String title, String msg,
    void Function() confirmAction) {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Text(
        msg,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: false,
          onPressed: () {
            Navigator.pop(context);
            confirmAction();
          },
          child: Text(
            "Confirm",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    ),
  );
}

void showLoadingDialog(BuildContext context) {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => const CupertinoAlertDialog(
      title: Text("Yuklanmoqda"),
      content: Center(
        child: Column(children: [
          SizedBox(
            height: 12,
          ),
          CupertinoActivityIndicator(
            radius: 12,
          )
        ]),
      ),
    ),
  );
}

Future<void> showAlertDialog(
    BuildContext context, String title, String message) async {
  await showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDestructiveAction: false,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Ok",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
