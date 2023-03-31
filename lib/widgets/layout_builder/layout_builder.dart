import 'package:e_commerce_clothing_ui/widgets/layout_builder/widget_local_size.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.builder});
  final Widget Function(BuildContext context, WidgetLocalSizes widgetSizes)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var widgetSizes = WidgetLocalSizes(
            localHeight: constraints.maxHeight,
            localWidth: constraints.maxWidth);
        return builder(context, widgetSizes);
      },
    );
  }
}
