import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  // StatefulWidget {
  final Item catelog;
  AddToCart({super.key, required this.catelog});

  //   @override
  //   State<AddToCart> createState() => _AddToCartState();
  // }

  // class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatelogModel _catelog = (VxState.store as MyStore).cart.catelog;

    bool isInCart = _cart.items.contains(catelog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: catelog);
          // isInCart = isInCart.toggle();
          // final _catelog = CatelogModel();
          // _cart.catelog = _catelog;
          // _cart.add(catelog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          context.theme.appBarTheme.foregroundColor,
        ),
        foregroundColor: WidgetStateProperty.all(MyTheme.creamColor),
        shape: WidgetStateProperty.all(StadiumBorder()),
      ),
      child: isInCart
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus), //"Add to Cart".text.make(),
    );
  }
}
