import 'dart:developer';

import 'package:aceshop/models/constraints/constraints.dart';
import 'package:aceshop/models/constraints/product_details_temp.dart';
import 'package:aceshop/models/usermodel/user_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/widgets/order_panel.dart';
import 'package:aceshop/views/account/widgets/recent_panel.dart';
import 'package:aceshop/views/account/widgets/top_panel.dart';
import 'package:aceshop/views/search/recents.dart';
import 'package:aceshop/views/widgets/product_listing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

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
                  RecentPanel(),
                ],
              )
            : Column(
                children: [
                  TopPanel(user: user),
                ],
              ));
  }
}
