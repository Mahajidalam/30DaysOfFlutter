import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Catalog";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/files/catelog.json");
    var decodeData = jsonDecode(catelogJson);
    var productsData = decodeData['products'];
    // print(productsData);
    CatelogModel.items = List.from(
      productsData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatelogModel.items[0]);
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
        child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatelogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: CatelogModel.items[index]);
                },
              )
            : Center(child: CircularProgressIndicator()),
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
