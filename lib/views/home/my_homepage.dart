import 'package:aceshop/models/constraints/catrgories_temp.dart';
import 'package:aceshop/models/constraints/constraints.dart';
import 'package:aceshop/views/home/category_listview.dart';
import 'package:aceshop/views/home/featured_products.dart';
import 'package:aceshop/views/home/offer_widget.dart';
import 'package:aceshop/views/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AceShop'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        scrolledUnderElevation: 2,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell)),
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartShopping))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(),
          ),
          offerWidget(),
          CatrgoryListView(),
          FeaturedProductView()
        ],
      ))),
    );
  }
}
