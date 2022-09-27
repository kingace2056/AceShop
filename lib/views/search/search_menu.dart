import 'package:aceshop/views/search/recents.dart';
import 'package:aceshop/views/search/search_bar.dart';
import 'package:flutter/material.dart';

class SearchMenuPage extends StatefulWidget {
  const SearchMenuPage({Key? key}) : super(key: key);

  @override
  State<SearchMenuPage> createState() => _SearchMenuPageState();
}

class _SearchMenuPageState extends State<SearchMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AceShop'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        scrolledUnderElevation: 2,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [SearchBar(), const RecentSearch()]),
      ),
    );
  }
}
