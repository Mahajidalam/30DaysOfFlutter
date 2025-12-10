import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int days = 30;
  final String name = "Catalog";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        // title: Text('Catalog App', style: TextStyle(color: Colors.black)),
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Welcome to $days days of flutter by $name' +
                context.runtimeType.toString(),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
