
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().wh40(context);
  }
}