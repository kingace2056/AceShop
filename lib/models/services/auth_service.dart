// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:aceshop/constraints/error_handling.dart';
import 'package:aceshop/constraints/secrets.dart';
import 'package:aceshop/constraints/utils.dart';
import 'package:aceshop/models/usermodel/user_model.dart';
import 'package:aceshop/providers/user_provider.dart';
// import 'package:aceshop/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // signup new user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []);

      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      log('${res.statusCode}is response code');

      httpError(
          response: res,
          context: context,
          onSuccess: () {
            showDialog(
                context: (context),
                builder: (context) => AlertDialog(
                      title: const Text('Successfully signed up'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: const Text('Login'))
                      ],
                    ));
          });
    } catch (e) {
      log(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$baseUrl/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      log('${res.statusCode}is response code');

      httpError(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);

            prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

            log('this is the token: ${jsonDecode(res.body)['token']}');
            showDialog(
                context: (context),
                builder: (context) => AlertDialog(
                      title: const Text('Successfully logged in'),
                      content: Column(
                        children: [],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              print(User);

                              Navigator.of(context).pushReplacementNamed('/');
                            },
                            child: const Text('Start Shopping !!!'))
                      ],
                    ));
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get userdata

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(
        'x-auth-token',
      );
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$baseUrl/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        //get user data if token is okay
        http.Response userRes = await http.get(
            Uri.parse(
              '$baseUrl/',
            ),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
