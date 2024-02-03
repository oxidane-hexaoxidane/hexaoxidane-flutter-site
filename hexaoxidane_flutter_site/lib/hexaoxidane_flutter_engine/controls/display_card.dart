import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? surfaceTintColor;
  final Function()? onTap;
  final Widget child;

  const DisplayCard({
    super.key,
    this.width,
    this.height,
    this.surfaceTintColor,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Card(
        surfaceTintColor: surfaceTintColor ?? Colors.transparent,
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
