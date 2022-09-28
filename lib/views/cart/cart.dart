import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/models/services/auth_service.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/user/nologin.dart';
import 'package:aceshop/views/cart/cart_item.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  void initState() {
    final AuthService authService = AuthService();
    authService.getUserData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return user.token == '' || user.token == null
        ? const AccountNotLoggedIn()
        : SingleChildScrollView(
            padding: defpad,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'My Cart (3)',
                      style: TextStyle(
                          color: primaryBlk,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                              color: primary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const CartItem();
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Recommended For you',
                          style: TextStyle(
                              color: primaryBlk, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: null,
                            child: Text(
                              'See All',
                              style: TextStyle(color: primary),
                            ))
                      ],
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        // final prodData = prodList?[index];
                        return ProductListing(
                            product: Product(
                                name: 'Dumb Prod',
                                description: 'Dumb product for dum dums ',
                                quantity: 3,
                                images: ['https://picsum.photos/200/300'],
                                category: 'Foods',
                                rating: [],
                                price: 3000));
                      }),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
