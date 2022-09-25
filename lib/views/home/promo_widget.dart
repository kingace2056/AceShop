import 'package:aceshop/constraints/constraints.dart';
import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
          color: secGreen, borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                const Text(
                  'Apple Watch Series 8 ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Rs. 45,000',
                      style: TextStyle(
                          color: primaryWhite,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      'Rs. 30,000',
                      style: TextStyle(
                        color: primaryWhite,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Shop Now',
                      style: TextStyle(color: primaryWhite),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: primaryWhite,
                    )
                  ],
                ),
              ],
            )),
        Positioned(
          right: 3,
          top: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/smartW.png'))),
          ),
        )
      ]),
    );
  }
}
