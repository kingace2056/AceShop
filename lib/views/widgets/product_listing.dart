import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/providers/user_provider.dart';

class ProductListing extends StatelessWidget {
  final String prodName;
  final String prodImage;
  final String prodPrice;
  final String prodRating;
  final int randIndex;
  VoidCallback btnFunc = () {};
  ProductListing({
    Key? key,
    required this.prodName,
    required this.prodImage,
    required this.prodPrice,
    required this.prodRating,
    required this.randIndex,
    required this.btnFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
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
                          prodImage,
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
                    prodName,
                    maxLines: 1,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: primaryBlk,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Rs $prodPrice',
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
                        prodRating,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text('  ${randIndex * 10 + 3 + randIndex * 2} Reviews',
                          style: const TextStyle(fontSize: 13)),
                      const Spacer(),
                      user.type == 'admin'
                          ? IconButton(
                              onPressed: () {
                                this.btnFunc;
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                // size: 13,
                              ))
                          : Icon(
                              Icons.more_vert_outlined,
                              size: 13,
                            )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
