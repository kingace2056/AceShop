import 'package:aceshop/constraints/constraints.dart';
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

  delProd(Product product, int index) {
    adminServices.deleteProd(
        context: context,
        product: product,
        onSuccess: () {
          products!.remove(index);
          setState(() {});
        });
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
                  return Container(
                      decoration:
                          const BoxDecoration(color: primaryWhite, boxShadow: [
                        BoxShadow(
                            color: secSoftGrey,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                            spreadRadius: 2)
                      ]),
                      margin: const EdgeInsets.only(
                          top: 3, left: 0, right: 8, bottom: 8),
                      // height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.48,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 0.25,

                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: primaryWhite,
                                  image: DecorationImage(
                                      alignment: Alignment.center,
                                      image: NetworkImage(
                                        prodData.images[0],
                                      ))),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  prodData.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: primaryBlk,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  'Rs ${prodData.price}',
                                  style: const TextStyle(
                                      color: secRed,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: primaryOrange,
                                      size: 13,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '2',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                        // '  ${ * 10 + 3 + randIndex * 2} Reviews',
                                        'xx reviews',
                                        style: const TextStyle(fontSize: 13)),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          delProd(prodData, index);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          // size: 13,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ));
                },
              ),
      ],
    );
  }
}
