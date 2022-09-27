import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/views/widgets/product_listing.dart';

class RecentPanel extends StatelessWidget {
  const RecentPanel({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
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
              const Text('Recent orders'),
              TextButton(onPressed: () {}, child: const Text('See all'))
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
              product: product,
            );
          },
        ),
      ],
    );
  }
}
