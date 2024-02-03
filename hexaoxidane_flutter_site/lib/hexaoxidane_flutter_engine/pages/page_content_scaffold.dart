import 'package:flutter/material.dart';

class PageContentScaffold extends StatelessWidget {
  const PageContentScaffold({
    super.key,
    required this.alignment,
    required this.children,
  });

  final PageContentAlignment alignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: alignment.direction == PageContentDirection.vertical
          ? Column(
              mainAxisAlignment: alignment.mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment: alignment.crossAxisAlignment ?? CrossAxisAlignment.start,
              children: [
                SizedBox(height: alignment.headerSpacing ?? 80),
                ...children,
                SizedBox(height: alignment.footerSpacing ?? 80),
              ],
            )
          : alignment.direction == PageContentDirection.horizontal
              ? Row(
                  mainAxisAlignment: alignment.mainAxisAlignment ?? MainAxisAlignment.center,
                  crossAxisAlignment: alignment.crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: alignment.headerSpacing ?? 80),
                    ...children,
                    SizedBox(width: alignment.footerSpacing ?? 80),
                  ],
                )
              : const SizedBox.shrink(),
    );
  }
}

enum PageContentDirection { horizontal, vertical }

class PageContentAlignment {
  final PageContentDirection direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? headerSpacing;
  final double? footerSpacing;

  PageContentAlignment({
    this.direction = PageContentDirection.vertical,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.headerSpacing,
    this.footerSpacing,
  });
}
