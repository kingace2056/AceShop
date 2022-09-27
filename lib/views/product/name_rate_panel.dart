import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/models/services/product_model/product_details_services.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/views/home/featured_products.dart';
import 'package:aceshop/views/product/name_rate_panel.dart';
import 'package:aceshop/views/product/prod_description.dart';
import 'package:aceshop/views/product/review_panel.dart';
import 'package:aceshop/views/product/seller_badge.dart';

class NamePanel extends StatelessWidget {
  NamePanel({
    Key? key,
    required this.product,
    required this.prodRating,
  }) : super(key: key);
  final Product product;
  final double prodRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            maxLines: 1,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: primaryBlk,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'Rs ${product.price}',
            style: TextStyle(
                fontSize: 18, color: secRed, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.star,
                color: primaryOrange,
                size: 16,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                prodRating.toString(),
                style: TextStyle(fontSize: 16),
              ),
              const Text('  ${1 * 10 + 3 + 1 * 2} Reviews',
                  style: TextStyle(fontSize: 16)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: product.quantity == 0 ? labelRed : labelGrn),
                child: Text(
                  product.quantity != 0 ? 'Available ' : 'Unavailable',
                  style: TextStyle(
                      fontSize: 18,
                      color: product.quantity != 0 ? secGreen : secRed,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
