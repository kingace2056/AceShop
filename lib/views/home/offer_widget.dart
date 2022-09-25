import 'package:aceshop/constraints/constraints.dart';
import 'package:flutter/material.dart';

class offerWidget extends StatelessWidget {
  const offerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      decoration:
          BoxDecoration(color: secRed, borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.66,
          decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'AceShop Dhamaka ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'February 31 - April 1',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        Positioned(
          right: 4,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/surprised.png'))),
          ),
        ),
      ]),
    );
  }
}
