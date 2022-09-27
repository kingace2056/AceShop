import 'dart:developer';

import 'package:aceshop/views/product/rate_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/models/services/product_model/product_details_services.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/home/featured_products.dart';
import 'package:aceshop/views/product/name_rate_panel.dart';
import 'package:aceshop/views/product/prod_description.dart';
import 'package:aceshop/views/product/review_panel.dart';
import 'package:aceshop/views/product/seller_badge.dart';

bool showLess = true;

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductDetailServices productDetailServices = ProductDetailServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: defpad,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: productDemo.length,

              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            widget.product.images[0],
                          ))),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              // options: opt,
            ),
            const SizedBox(
              height: 40,
            ),
            NamePanel(
              product: widget.product,
              prodRating: avgRating,
            ),
            const SellerBadge(),
            // SizedBox(
            //   child: Column(
            //     children: [
            //       const Text('Rate this product'),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [Stars(rating: 2.5)],
            //       )
            //     ],
            //   ),
            // ),
            RateProd(
                myRating: myRating,
                productDetailServices: productDetailServices,
                widget: widget),
            SizedBox(
              height: 10,
            ),
            DescriptionPanel(
              prodDescp: widget.product.description,
            ),
            ReviewPanel(product: widget.product),
            const FeaturedProductView(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: defpad,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  // width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: secRed, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Add To Wishlist',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      const Spacer(),
                      const Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  // width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
