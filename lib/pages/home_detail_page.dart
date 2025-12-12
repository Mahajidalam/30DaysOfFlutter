import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;
  const HomeDetailPage({super.key, required this.catelog})
    : assert(catelog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  MyTheme.darkBuishColor,
                ),
                foregroundColor: WidgetStateProperty.all(MyTheme.creamColor),
                shape: WidgetStateProperty.all(StadiumBorder()),
              ),
              child: "Add to Cart".text.make(),
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catelog.id.toString()),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.bold.xl
                          .color(MyTheme.darkBuishColor)
                          .make(),
                      catelog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "hfjkfjgggjlgglhhfjkfjgggjlgglhhfjkfjgggjlgglhhfjkfjgggjlgglhhfjkfjgggjlgglhhfjkfjgggjlgglhhfjkfjgggjlgglh"
                          .text
                          .textStyle(context.captionStyle)
                          .make().p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
