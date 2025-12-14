import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widget/add_to_cart.dart';
import 'package:flutter_catalog/widgets/home_widget/catelog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return !Vx.isMobileOS
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20
            ),
            shrinkWrap: true,
            itemCount: CatelogModel.items.length,
            itemBuilder: (context, index) {
              final catelog = CatelogModel.items[index]; //getByPosition(index);
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
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatelogModel.items.length,
            itemBuilder: (context, index) {
              final catelog = CatelogModel.items[index]; //getByPosition(index);
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
    var children = [
      Hero(
        tag: Key(catelog.id.toString()),
        child: CatelogImage(image: catelog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.bold.lg
                .color(context.theme.appBarTheme.surfaceTintColor)
                .make(),
            catelog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catelog.price}".text.bold.xl.make(),
                AddToCart(catelog: catelog),
              ],
            ).pOnly(right: 8.0),
          ],
        ).p(context.isMobile ? 0 : 10),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(children: children)
          : Column(children: children),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
