import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_site/hexaoxidane_flutter_site.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_site_web/pages/home_page.dart';

class RouterBuilder extends ConsumerStatefulWidget {
  final Widget Function(GoRouter, WidgetRef) builder;

  const RouterBuilder({
    super.key,
    required this.builder,
  });

  @override
  ConsumerState<RouterBuilder> createState() => _RouterBuilderState();
}

class _RouterBuilderState extends ConsumerState<RouterBuilder> {
  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(
      routes: <RouteBase>[
        const _IndexRouteBuilder().build(context, ref),
      ],
    );

    return widget.builder(router, ref);
  }
}

class RoutePathBuilder {
  final String path;

  RoutePathBuilder({
    this.path = '',
  });

  RoutePathBuilder index() => _append('/');

  RoutePathBuilder _append(String path) {
    return RoutePathBuilder(path: '${this.path}$path');
  }
}

abstract class _RouteBuilder {
  const _RouteBuilder();

  GoRoute build(BuildContext context, WidgetRef ref);
}

class _IndexRouteBuilder extends _RouteBuilder {
  const _IndexRouteBuilder();

  @override
  GoRoute build(BuildContext context, WidgetRef ref) {
    return GoRoute(
      path: RoutePathBuilder().index().path,
      builder: (BuildContext context, GoRouterState state) {
        return MixpanelProvider(
          builder: (Mixpanel mixpanel) {
            Map<String, dynamic> properties = {};

            String? origin = state.uri.queryParameters['o'];
            if (origin != null && origin.isNotEmpty) {
              properties['origin'] = origin;
            }

            mixpanel.track(
              'site_visit',
              properties: properties,
            );

            return const HomePage();
          },
        );
      },
    );
  }
}
