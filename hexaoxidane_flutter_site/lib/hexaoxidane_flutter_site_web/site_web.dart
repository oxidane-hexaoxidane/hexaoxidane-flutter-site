import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_engine/hexaoxidane_flutter_engine.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_site_web/hexaoxidane_flutter_site_web.dart';

class SiteWeb extends StatefulWidget {
  const SiteWeb({super.key});

  @override
  State<SiteWeb> createState() => _SiteWebState();
}

class _SiteWebState extends State<SiteWeb> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: RouterBuilder(
        builder: (GoRouter router, WidgetRef ref) {
          return PageScaffoldRoot(
            child: MaterialApp.router(
              routerConfig: router,
              scrollBehavior: CustomScrollBehaviour(),
              title: "HexaOxidane",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.blue,
                  accentColor: const Color(0xFF012848),
                  cardColor: Colors.white,
                  backgroundColor: Colors.white,
                  errorColor: Colors.red[900],
                  brightness: Brightness.light,
                ),
                textTheme: GoogleFonts.notoSansTextTheme(),
                useMaterial3: true,
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.windows: NoPageTransitionsBuilder(),
                    TargetPlatform.macOS: NoPageTransitionsBuilder(),
                    TargetPlatform.linux: NoPageTransitionsBuilder(),
                    TargetPlatform.fuchsia: NoPageTransitionsBuilder(),
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
