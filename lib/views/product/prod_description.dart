import 'package:aceshop/models/services/product_model/product_details_services.dart';
import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';

class DescriptionPanel extends StatefulWidget {
  const DescriptionPanel({
    Key? key,
    required this.prodDescp,
  }) : super(key: key);
  final String prodDescp;

  @override
  State<DescriptionPanel> createState() => _DescriptionPanelState();
}

class _DescriptionPanelState extends State<DescriptionPanel> {
  bool showLess = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: defpad,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Product Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Text(
                widget.prodDescp,
                maxLines: showLess ? 8 : null,
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        print(
                          widget.prodDescp,
                        );
                        print(showLess);
                        setState(() {
                          showLess = !showLess;
                          print(showLess);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(showLess ? 'See More' : 'See Less'),
                          Icon(
                            showLess
                                ? Icons.double_arrow_rounded
                                : Icons.keyboard_double_arrow_left_rounded,
                            size: 18,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
