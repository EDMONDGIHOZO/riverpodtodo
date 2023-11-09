import "package:flutter/material.dart";
import "package:riverpodtodo/utils/extensions.dart";

class CommonContainer extends StatelessWidget {
  final Widget? child;
  const CommonContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 0.3;
    final colors = context.colorScheme;

    return Container(
        width: double.maxFinite,
        height: containerHeight,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colors.primaryContainer),
        child: SingleChildScrollView(child: child));
  }
}
