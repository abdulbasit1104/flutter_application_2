// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, unused_import, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LoadData();
  }

  // ignore: non_constant_identifier_names
  LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["product"];
    CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unnecessary_null_comparison
        child: (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemBuilder: (context, index) {
                  final Item = CatalogModel.Items[index];

                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(
                            // ignore: sort_child_properties_last
                            child: Text(Item.name),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                            ),
                          ),
                          footer: Text(Item.price.toString()),
                          child: Image.network(Item.image)));
                },
                itemCount: CatalogModel.Items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
