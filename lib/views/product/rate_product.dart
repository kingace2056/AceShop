import 'package:aceshop/views/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/product_model/product_details_services.dart';

class RateProd extends StatelessWidget {
  const RateProd({
    Key? key,
    required this.myRating,
    required this.productDetailServices,
    required this.widget,
  }) : super(key: key);

  final double myRating;
  final ProductDetailServices productDetailServices;
  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text(
                'Rate this product',
                style: TextStyle(
                    color: primaryBlk,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: primaryOrange),
              onRatingUpdate: (rating) {
                productDetailServices.rateProduct(
                  context: context,
                  product: widget.product,
                  rating: rating,
                );
              })
        ],
      ),
    );
  }
}
