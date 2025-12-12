import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(context.theme.appBarTheme.surfaceTintColor).make(),
        "Trending Products".text.xl2.bold.color(context.theme.appBarTheme.surfaceTintColor).make(),
      ],
    );
  }
}
