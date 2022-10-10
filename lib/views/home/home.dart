import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/views/home/category_listview.dart';
import 'package:aceshop/views/home/featured_products.dart';
import 'package:aceshop/views/home/offer_widget.dart';
import 'package:aceshop/views/home/promo_widget.dart';
import 'package:aceshop/views/home/search_widhome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: defpad,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/search');
                },
                child: SearchHome()),
            offerWidget(),
            CatrgoryListView(),
            FeaturedProductView(),
            PromoWidget()
          ],
        ));
  }
}
