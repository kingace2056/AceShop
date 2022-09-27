import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/views/category/category_page.dart';
import 'package:aceshop/views/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);

  final TextEditingController searchController = TextEditingController();

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
          Expanded(
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(search: value)));
              },
              decoration: const InputDecoration(
                focusColor: primary,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search Product name',
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SearchPage(search: searchController.text)));
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
              )),
        ],
      ),
    );
  }
}
