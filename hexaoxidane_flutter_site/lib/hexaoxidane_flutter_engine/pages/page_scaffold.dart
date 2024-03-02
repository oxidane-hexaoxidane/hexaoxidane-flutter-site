import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

class PageScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? background;
  final Widget? controlBar;

  const PageScaffold({
    super.key,
    this.body,
    this.background,
    this.controlBar,
  });

  @override
  Widget build(BuildContext context) {
    return _StackScaffold(
      background: background,
      controlBar: controlBar,
      body: _ScrollableBody(
        body: body,
      ),
    );
  }
}

class _ScrollableBody extends StatefulWidget {
  final Widget? body;

  const _ScrollableBody({this.body});

  @override
  State<_ScrollableBody> createState() => __ScrollableBodyState();
}

class __ScrollableBodyState extends State<_ScrollableBody> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: DynMouseScroll(
        durationMS: 90,
        scrollSpeed: 1,
        animationCurve: Curves.linear,
        builder: (BuildContext context, ScrollController controller, ScrollPhysics physics) {
          return SingleChildScrollView(
            controller: controller,
            physics: physics,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: widget.body ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}

class _StackScaffold extends StatelessWidget {
  final Widget? background;
  final Widget? controlBar;
  final Widget? body;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _StackScaffold({
    this.background,
    this.controlBar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasControlBar = controlBar != null;

    return SelectionArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: hasControlBar && ResponsiveBreakpoints.of(context).isMobile
            ? AppBar(
                backgroundColor: Colors.white,
                title: const Text('HexaOxidane'),
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
            : null,
        drawer: controlBar,
        body: Stack(
          alignment: Alignment.center,
          children: [
            if (background != null) background!,
            Row(
              children: [
                if (hasControlBar && !ResponsiveBreakpoints.of(context).isMobile)
                  controlBar ?? const SizedBox.shrink(),
                if (body != null)
                  Flexible(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 300,
                          maxWidth: 1000,
                        ),
                        child: body,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
