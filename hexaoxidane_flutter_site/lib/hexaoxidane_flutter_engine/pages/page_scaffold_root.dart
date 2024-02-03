import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageScaffoldRoot extends StatelessWidget {
  final Widget child;

  const PageScaffoldRoot({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: child,
      breakpoints: [
        const Breakpoint(start: 0, end: 700, name: MOBILE),
        const Breakpoint(start: 701, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }
}
