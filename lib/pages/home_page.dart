import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int days = 30;
  final String name = "Catalog";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        // title: Text('Catalog App', style: TextStyle(color: Colors.black)),
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      // Center(
      //   child: Container(
      //     child: Text(
      //       'Welcome to $days days of flutter by $name' +
      //           context.runtimeType.toString(),
      //     ),
      //   ),
      // ),
      drawer: MyDrawer(),
    );
  }
}
