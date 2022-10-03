import 'dart:convert';
import 'dart:developer';

import 'package:aceshop/models/services/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:aceshop/constraints/error_handling.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/constraints/utils.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';

class CartServices {
  void decreaseFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse('$baseUrl/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpError(
          response: res,
          context: context,
          onSuccess: () async {
            User user =
                userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);

            userProvider.setUserFromModel(user);
            print('Success');
          });
    } catch (e) {
      log('SellProd Error');
      showSnackBar(context, e.toString());
    }
  }
}
