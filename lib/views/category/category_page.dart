import 'package:aceshop/models/product_model/product_model.dart';
import 'package:aceshop/models/services/home/home_services.dart';
import 'package:aceshop/views/widgets/loader.dart';
import 'package:flutter/material.dart';

import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/views/widgets/product_listing.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Product>? prodList;
  HomeServices homeServices = HomeServices();
  void initState() {
    // TODO: implement initState
    fetchCategoryProd();
    super.initState();
  }

  fetchCategoryProd() async {
    prodList = await homeServices.fetchCagegoryProds(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
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
          child: prodList == null
              ? Loader()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Explore ${widget.category}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    prodList!.length == 0
                        ? Center(
                            child: Text('No Products found'),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            itemCount: prodList?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final prodData = prodList?[index];
                              return ProductListing(
                                prodName: prodData!.name,
                                prodImage: prodData.images[0],
                                prodPrice: prodData.price.toString(),
                                prodRating: '3',
                                randIndex: index,
                                btnFunc: () {},
                              );
                            })
                  ],
                ),
        ));
  }
}
