import 'package:aceshop/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/product_model/product_details_services.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:provider/provider.dart';

class ReviewPanel extends StatefulWidget {
  final Product product;
  const ReviewPanel({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ReviewPanel> createState() => _ReviewPanelState();
}

class _ReviewPanelState extends State<ReviewPanel> {
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
    return Container(
      padding: defpad,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                'Reviews (${widget.product.rating!.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.star_rounded,
                color: primaryOrange,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                avgRating.toString(),
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          widget.product.rating!.isEmpty
              ? Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  padding: defpad,
                  color: labelGrn.withOpacity(0.5),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  child: const Center(child: Text('No Ratings Yet')),
                )
              : ListView.builder(
                  itemCount: widget.product.rating!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    bool descExp = false;
                    return Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      padding: defpad,
                      color: labelGrn.withOpacity(0.5),
                      // decoration: BoxDecoration(
                      //   color: labelBlue,
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      // margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://picsum.photos/200/300'),
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Jon Doe',
                                            style: TextStyle(
                                                color: primaryBlk,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                              5,
                                              (index) => const Icon(
                                                Icons.star_rounded,
                                                color: primaryOrange,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text(
                                        '3 days ago',
                                        style: TextStyle(
                                            color: primaryBlk,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(children: [
                                  const Text(
                                    loremIps,
                                    maxLines: 5,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(

                                        // color: primaryBlk,
                                        // fontSize: 20,

                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          Visibility(
            visible: widget.product.rating!.length == 2,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: defpad + const EdgeInsets.all(5),
                margin: defpad,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryBlk,
                    )),
                child: const Center(
                  child: Text('See All Reviews'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
