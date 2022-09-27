import 'dart:developer';

import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/models/services/auth_service.dart';
import 'package:aceshop/models/usermodel/user_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:aceshop/views/account/user/nologin.dart';
import 'package:aceshop/views/account/user/user_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  void initState() {
    final AuthService authService = AuthService();
    authService.getUserData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    log('${user.address} ${user.name}token ${user.token}');
    return user.token.isNotEmpty
        ? const UserPage()
        : const AccountNotLoggedIn();
  }
}
