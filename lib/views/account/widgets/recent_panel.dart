import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';

class RecentPanel extends StatelessWidget {
  const RecentPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: defpad,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent orders'),
              TextButton(onPressed: () {}, child: Text('See all'))
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: productDemo.length - 3,
          itemBuilder: (BuildContext context, int index) {
            return ProductListing(
              prodImage: productDemo.values.elementAt(index),
              prodName: productDemo.keys.elementAt(index),
              prodPrice: priceRatingDemo.keys.elementAt(index),
              prodRating: priceRatingDemo.values.elementAt(index),
              randIndex: index,
              btnFunc: () {},
            );
          },
        ),
      ],
    );
  }
}
