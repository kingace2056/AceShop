import 'dart:developer';

import 'package:aceshop/models/constraints/catrgories_temp.dart';
import 'package:aceshop/models/constraints/constraints.dart';
import 'package:aceshop/views/home/category_listview.dart';
import 'package:aceshop/views/home/featured_products.dart';
import 'package:aceshop/views/home/offer_widget.dart';
import 'package:aceshop/views/home/promo_widget.dart';
import 'package:aceshop/views/home/search_widhome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int currentIndex = 0;

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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: SearchHome()),
          ),
          offerWidget(),
          CatrgoryListView(),
          FeaturedProductView(),
          PromoWidget()
        ],
      ))),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
              log(currentIndex.toString());
            });
          },
          currentIndex: currentIndex,
          // backgroundColor: primary,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primary,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              label: 'Wishlist',
              icon: Icon(FontAwesomeIcons.solidHeart),
            ),
            BottomNavigationBarItem(
              label: 'Wishlist',
              icon: Icon(FontAwesomeIcons.bagShopping),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(FontAwesomeIcons.userAstronaut),
            ),
          ]),
    );
  }
}
