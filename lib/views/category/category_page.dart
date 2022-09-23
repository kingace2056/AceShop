import 'package:aceshop/models/constraints/product_details_temp.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'DummyCategory',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: productDemo.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ProductListing(
                      prodName: productDemo.keys.elementAt(index),
                      prodImage: productDemo.values.elementAt(index),
                      prodPrice: priceRatingDemo.keys.elementAt(index),
                      prodRating: priceRatingDemo.values.elementAt(index),
                      randIndex: index,
                    );
                  })
            ],
          ),
        ));
  }
}
