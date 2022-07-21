import 'package:flutter/material.dart';

void showCustomBottomSheet({required Widget body, required Color color, required BuildContext context}) {
  final getSizes = MediaQuery.of(context);

  showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    context: context,
    enableDrag: true,
    isDismissible: true,
    clipBehavior: Clip.antiAlias,
    backgroundColor: color,
    builder: (context) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: getSizes.size.height - getSizes.padding.top,
        ),
        child: Padding(
          padding: getSizes.viewInsets,
          child: SingleChildScrollView(
            child: SizedBox(
              child: body,
            ),
          ),
        ),
      );
    },
  );
}
