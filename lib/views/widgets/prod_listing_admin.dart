import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/views/product/product_page.dart';

// this is not used though kept here since we can use it in future

class ProductListing extends StatelessWidget {
  final Product product;
  // final int randIndex;

  final VoidCallback btnFunc;
  const ProductListing({
    Key? key,
    required this.product,
    required this.btnFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(
                  product: product,
                )));
      },
      child: Container(
          decoration: const BoxDecoration(color: primaryWhite, boxShadow: [
            BoxShadow(
                color: secSoftGrey,
                blurRadius: 10,
                offset: Offset(0, 2),
                spreadRadius: 2)
          ]),
          margin: const EdgeInsets.only(top: 3, left: 0, right: 8, bottom: 8),
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
                            product.images[0],
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
                      product.name,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: primaryBlk,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Rs $product.price',
                      style: const TextStyle(
                          color: secRed, fontWeight: FontWeight.bold),
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
                          //todo: change this to prod ratign
                          '2',
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text('  ${2 * 10 + 3 + 3 * 2} Reviews',
                            style: const TextStyle(fontSize: 13)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              this.btnFunc;
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
          )),
    );
  }
}
