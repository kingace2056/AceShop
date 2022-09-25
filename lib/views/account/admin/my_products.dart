import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/product_details_temp.dart';
import 'package:aceshop/models/product_model/product_model.dart';
import 'package:aceshop/models/services/admin/admin_services.dart';
import 'package:aceshop/views/widgets/loader.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';

class MyProds extends StatefulWidget {
  const MyProds({
    Key? key,
  }) : super(key: key);

  @override
  State<MyProds> createState() => _MyProdsState();
}

class _MyProdsState extends State<MyProds> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;

  @override
  void initState() {
    // TODO: implement initState
    getProductList();
    super.initState();
  }

  getProductList() async {
    products = await adminServices.getAllProd(context);
    // print(products![0]);
    setState(() {});
  }

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
              const Text('My products'),
              TextButton(onPressed: () {}, child: const Text('See all'))
            ],
          ),
        ),
        products == null
            ? const Loader()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products!.length,
                itemBuilder: (BuildContext context, int index) {
                  final prodData = products![index];
                  return ProductListing(
                      prodImage: prodData.images[0],
                      prodName: prodData.name,
                      prodPrice: prodData.price.toString(),
                      prodRating: '2.1',
                      randIndex: index);
                },
              ),
      ],
    );
  }
}
