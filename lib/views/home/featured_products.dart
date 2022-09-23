import 'package:aceshop/models/constraints/catrgories_temp.dart';
import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeaturedProductView extends StatelessWidget {
  const FeaturedProductView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Featured Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(color: primary, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryTemp.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ));
                })),
          ),
        ),
      ],
    );
  }
}
