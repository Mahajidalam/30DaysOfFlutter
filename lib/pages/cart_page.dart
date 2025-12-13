import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.headlineMedium(context).make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
  final _cart = CartModel();

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5
              .color(context.theme.appBarTheme.surfaceTintColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(context.theme.appBarTheme.foregroundColor)),
            child: 'Buy'.text
                .white
                .make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  // StatefulWidget {
//   const _CartList({super.key});

//   @override
//   State<_CartList> createState() => _CartListState();
// }

// class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? "Nothing to Show".text.xl2.makeCentered() : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){
          _cart.remove(_cart.items[index]);
          // setState(() {
            
          // });
        }, icon: Icon(Icons.remove_circle_outline)),
        title: _cart.items[index].name.text.make(),
      )
    );
  }
}
