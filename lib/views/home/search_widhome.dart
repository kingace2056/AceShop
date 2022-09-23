import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
          child: Text(
            'Search Product name',
            style: TextStyle(color: secHalfGrey),
          ),
        )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
            )),
      ],
    );
  }
}
