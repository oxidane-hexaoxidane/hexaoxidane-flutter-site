import 'package:flutter/material.dart';

class FutureDataBox<TData> extends StatelessWidget {
  final Future<TData> dataProvider;
  final TData Function(TData)? onPreProcessData;
  final Widget Function(BuildContext, TData) builder;

  const FutureDataBox({
    super.key,
    required this.dataProvider,
    this.onPreProcessData,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataProvider,
      builder: (BuildContext context, AsyncSnapshot<TData> snapshot) {
        // NOTE: Do a loading widget here in the future...
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          // ignore: null_check_on_nullable_type_parameter
          TData data = snapshot.data!;

          if (onPreProcessData != null) {
            data = onPreProcessData!(data);
          }

          return SizedBox(
            child: builder(context, data),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
