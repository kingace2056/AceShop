import 'dart:developer';

import 'package:aceshop/models/services/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/secrets.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'My orders',
                style: TextStyle(color: primaryBlk),
              ),
              TextButton(onPressed: () {}, child: Text('See all'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: defpad,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.creditCard,
                        color: primaryBlk.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To pay',
                        style: TextStyle(
                          color: primaryBlk.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: defpad,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.boxArchive,
                        color: primaryBlk.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To Ship',
                        style: TextStyle(
                          color: primaryBlk.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: defpad,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.truckFast,
                        color: primaryBlk.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To Receive',
                        style: TextStyle(
                          color: primaryBlk.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: defpad,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.message,
                        color: primaryBlk.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'To Review',
                        style: TextStyle(
                          color: primaryBlk.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    log('tapped hai :) ');
                  },
                  child: Container(
                    padding: defpad,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.repeat_rounded),
                        Text(' My returns')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    log('tapped hai :) ');
                  },
                  child: Container(
                    padding: defpad,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cancel_presentation_outlined,
                          size: 25,
                        ),
                        Text(' My Cancellations')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
