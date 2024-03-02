import 'package:flutter/material.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:hexaoxidane_flutter_site/hexaoxidane_flutter_engine/hexaoxidane_flutter_engine.dart';

class MixpanelProvider extends StatefulWidget {
  const MixpanelProvider({
    super.key,
    required this.builder,
  });

  final Widget Function(Mixpanel) builder;

  @override
  State<MixpanelProvider> createState() => _MixpanelProviderState();
}

class _MixpanelProviderState extends State<MixpanelProvider> {
  static Mixpanel? _mixpanel;

  Future<Mixpanel> initMixpanel() async {
    return await Mixpanel.init(
      'fb4bdc86e6de339a10ba3c37e8cdb2f4',
      trackAutomaticEvents: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_mixpanel == null) {
      return FutureDataBox(
        dataProvider: initMixpanel(),
        builder: (BuildContext context, Mixpanel mixpanel) {
          _mixpanel = mixpanel;
          return widget.builder(_mixpanel!);
        },
      );
    } else {
      return widget.builder(_mixpanel!);
    }
  }
}
