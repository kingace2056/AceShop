import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:aceshop/constraints/error_handling.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/constraints/utils.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';

class AdminServices {
  Future<void> sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic(cloudNames, uploadPresets);
      List<String> imageUrl = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse cloudresp = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path, folder: name + user.name));
        log(cloudinary.toString());

        imageUrl.add(cloudresp.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imageUrl);

      http.Response postRes = await http.post(
          Uri.parse(
            '$baseUrl/admin/add-product',
          ),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'x-auth-token': user.token
          },
          body: product.toJson());
      httpError(
        response: postRes,
        context: context,
        onSuccess: () async {
          // showSnackBar(context, 'Submitted successfully');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('Successfully submitted'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: const Text('Finish'),
                )
              ],
            ),
          );
        },
      );
    } catch (e) {
      log('SellProd Error');
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> getAllProd(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$baseUrl/admin/get-products'), headers: {
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

  void deleteProd(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // List<Product> productList = [];
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/admin/delete-product'),
        body: jsonEncode(
          {'id': product.id},
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          'x-auth-token': userProvider.user.token,
        },
      );
      httpError(
        response: res,
        context: context,
        onSuccess: () async {
          // showSnackBar(context, 'Submitted successfully');
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('Successfully Deleted'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: const Text('Finish'),
                )
              ],
            ),
          );
        },
      );
    } catch (e) {
      log('*****\n');
      log(e.toString());
      log('*****\n');
      showSnackBar(context, e.toString());
    }
  }
}
