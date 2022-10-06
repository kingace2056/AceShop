import 'dart:async';

import 'package:aceshop/constraints/constraints.dart';
import 'package:flutter/material.dart';

Color textCol = primary;

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    selColor();
    // TODO: implement initState
  }

  selColor() {
    List<Color> col = [
      primary,
      primaryBlk,
      primaryBlk,
      primaryOrange,
      secRed,
      secGreen,
      secHalfGrey,
      Colors.greenAccent,
      Colors.pink,
      Colors.purple
    ];

    var timeNow = DateTime.now().second % 10;

    setState(() {
      textCol = col[timeNow];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Page \nUnder \nConstruction',
        style: TextStyle(
            color: textCol, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
