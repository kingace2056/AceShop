// import 'package:aceshop/models/services/home/home_services.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/models/services/search/search_services.dart';
import 'package:aceshop/views/widgets/loader.dart';
import 'package:flutter/material.dart';

import 'package:aceshop/views/widgets/product_listing.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.search,
  }) : super(key: key);
  final String search;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product>? prodList;
  SearchServices searchServices = SearchServices();
  @override
  void initState() {
    // TODO: implement initState
    fetchSearchProd();
    super.initState();
  }

  fetchSearchProd() async {
    prodList = await SearchServices().searchProds(
      context: context,
      searchQuery: widget.search,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.search),
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
                        'Explore ${widget.search}',
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
                                product: prodData!,
                                // btnFunc: () {},
                              );
                            })
                  ],
                ),
        ));
  }
}
