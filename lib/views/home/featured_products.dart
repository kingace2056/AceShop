import 'package:aceshop/constraints/catrgories_temp.dart';
import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/views/category/category_page.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeaturedProductView extends StatelessWidget {
  const FeaturedProductView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryPage(category: 'Category')));
                },
                child: Text(
                  'See all',
                  style: TextStyle(color: primary, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productDemo.length,
                itemBuilder: ((context, index) {
                  return ProductListing(
                    prodName: productDemo.keys.elementAt(index),
                    prodImage: productDemo.values.elementAt(index),
                    prodPrice: priceRatingDemo.keys.elementAt(index),
                    prodRating: priceRatingDemo.values.elementAt(index),
                    randIndex: index,
                    btnFunc: () {},
                  );
                })),
          ),
        ),
      ],
    );
  }
}
