import 'dart:convert';
import 'dart:developer';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:aceshop/constraints/constraints.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/constraints/error_handling.dart';
import 'package:aceshop/constraints/utils.dart';

import 'package:aceshop/providers/user_provider.dart';

class SearchServices {
  Future<List<Product>> searchProds({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('$baseUrl/api/products/search/$searchQuery'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'x-auth-token': userProvider.user.token,
          });
      httpError(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      log('this is error here $e');
      showSnackBar(context, 'this is error here $e');
    }
    return productList;
  }
}
