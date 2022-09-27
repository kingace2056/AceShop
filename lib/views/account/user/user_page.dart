import 'package:aceshop/models/usermodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/admin/my_products.dart';
import 'package:aceshop/views/account/widgets/order_panel.dart';
import 'package:aceshop/views/account/widgets/recent_panel.dart';
import 'package:aceshop/views/account/widgets/top_panel.dart';

class UserPage extends StatefulWidget {
  final User user;
  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SingleChildScrollView(
        child: user.type == 'user'
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TopPanel(user: user),
                  OrderPanel(
                    user: user,
                  ),
                  RecentPanel(
                    product: Product(
                        name: 'Fix This',
                        description: 'Fix this page for normal user',
                        quantity: 3,
                        images: [
                          'https://res.cloudinary.com/dw7ehikmk/image/upload/v1664290218/RC%20Helicopter%20Admin%20ACE/qrfhs3kgmlhwxqsovhgy.webp'
                        ],
                        category: 'Foods',
                        rating: [],
                        price: 400),
                  ),
                ],
              )
            : Column(
                children: [
                  TopPanel(user: user),
                  const MyProds(),
                ],
              ));
  }
}
