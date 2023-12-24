import 'dart:convert';
import 'package:ebuy_on/models/catalog.dart';
import 'package:ebuy_on/widget/iterm_widget.dart';
import 'package:ebuy_on/widget/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModel.items[index],
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}


//TODO- 4.24 time next watch 
