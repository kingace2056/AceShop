import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/views/category/category_page.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';
import '../../models/services/home/home_services.dart';

class FeaturedProductView extends StatefulWidget {
  const FeaturedProductView({
    Key? key,
  }) : super(key: key);

  @override
  State<FeaturedProductView> createState() => _FeaturedProductViewState();
}

class _FeaturedProductViewState extends State<FeaturedProductView> {
  List<Product>? prodList;
  HomeServices homeServices = HomeServices();
  @override
  void initState() {
    // TODO: implement initState
    fetchCategoryProd();
    super.initState();
  }

  fetchCategoryProd() async {
    prodList = await homeServices.fetchCagegoryProds(
      context: context,
      category: 'Electronics',
    );
    setState(() {});
  }

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
              const Text(
                'Featured Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const CategoryPage(category: 'Electronics')));
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: primary, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
        prodList == null
            ? Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: const Center(
                  child: Text('No product available right now '),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: prodList?.length == 0
                      ? const Center(
                          child: Text('No Products found'),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: prodList?.length,
                          itemBuilder: ((context, index) {
                            final prodData = prodList?[index];
                            return ProductListing(
                              product: prodData!,
                            );
                          }),
                        ),
                ),
              ),
      ],
    );
  }
}
