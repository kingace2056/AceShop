import 'dart:developer';
import 'package:aceshop/constraints/catrgories_temp.dart';
import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/device_check.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/account_page.dart';
import 'package:aceshop/views/cart/cart.dart';
import 'package:aceshop/views/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'views/home/home.dart';

int currentIndex = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selPage = 0;
  final _pages = [
    const HomePage(),
    const WishListPage(),
    const ShoppingCart(),
    const MyAccount()
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
              onPressed: () {
                setState(() {
                  selPage = 2;
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ))
        ],
      ),
      body: DeviceCheck().isDesk(context: context)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationRail(
                    elevation: 10,
                    groupAlignment: 0,
                    indicatorColor: primary,
                    onDestinationSelected: (value) {
                      setState(() {
                        selPage = value;
                        log(selPage.toString());
                      });
                    },
                    destinations: const [
                      NavigationRailDestination(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        label: Text('Home'),
                        icon: Icon(FontAwesomeIcons.house),
                      ),
                      NavigationRailDestination(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        label: Text('Wishlist'),
                        icon: Icon(FontAwesomeIcons.solidHeart),
                      ),
                      NavigationRailDestination(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        label: Text('Cart'),
                        icon: Icon(FontAwesomeIcons.bagShopping),
                      ),
                      NavigationRailDestination(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        label: Text('Account'),
                        icon: Icon(FontAwesomeIcons.userAstronaut),
                      ),
                    ],
                    selectedIndex: selPage),
                Flexible(
                  fit: FlexFit.loose,
                  child: _pages[
                      user.token == '' || user.token == null ? 3 : selPage],
                )
              ],
            )
          : _pages[user.token == '' || user.token == null ? 3 : selPage],
      floatingActionButton: user.type == 'admin'
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary, foregroundColor: primaryWhite),
              onPressed: () {
                categoryTemp.keys.toList();
                Navigator.of(context).pushNamed('/addproduct');
                //this is some commit
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text(
                      'Add Product',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          : null,
      bottomNavigationBar: Visibility(
        visible: !DeviceCheck().isDesk(context: context),
        child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(
              color: primary,
            ),
            onTap: (value) {
              setState(() {
                selPage = value;
                log(selPage.toString());
              });
            },
            currentIndex: selPage,
            // backgroundColor: primary,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primary,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(FontAwesomeIcons.house),
              ),
              BottomNavigationBarItem(
                label: 'Wishlist',
                icon: Icon(FontAwesomeIcons.solidHeart),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(FontAwesomeIcons.bagShopping),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: Icon(FontAwesomeIcons.userAstronaut),
              ),
            ]),
      ),
    );
  }
}
