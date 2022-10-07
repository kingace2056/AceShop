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

class ProductDetailServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );

      httpError(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Successfully rated $rating');
          });
    } catch (e) {
      log('SellProd Error');
      showSnackBar(context, e.toString());
    }
  }

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
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
