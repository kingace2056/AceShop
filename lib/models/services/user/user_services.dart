// ignore_for_file: use_build_context_synchronously

import 'package:aceshop/constraints/utils.dart';
import 'package:aceshop/models/services/user/user_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Provider.of<UserProvider>(context, listen: false).user.token = '';
      print(Provider.of<UserProvider>(context, listen: false).user.token +
          'is the token \n **** \n');
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
