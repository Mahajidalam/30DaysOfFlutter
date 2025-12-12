import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widget/catelog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.getByPosition(index);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catelog: catelog),
              ),
            );
          },
          child: CatalogItem(catelog: catelog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catelog;
  const CatalogItem({super.key, required this.catelog})
    : assert(catelog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catelog.id.toString()),
            child: CatelogImage(image: catelog.image)
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catelog.name.text.bold.lg.color(context.theme.appBarTheme.surfaceTintColor).make(),
                catelog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catelog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          context.theme.appBarTheme.foregroundColor,
                        ),
                        foregroundColor: WidgetStateProperty.all(
                          MyTheme.creamColor,
                        ),
                        shape: WidgetStateProperty.all(StadiumBorder()),
                      ),
                      child: "Add to Cart".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
