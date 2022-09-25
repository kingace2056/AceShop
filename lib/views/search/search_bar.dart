import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/views/category/category_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: secSoftGrey),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                focusColor: primary,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search Product name',
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(category: 'category')));
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
              )),
        ],
      ),
    );
  }
}
