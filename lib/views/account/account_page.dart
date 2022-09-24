import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary, foregroundColor: primaryWhite),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text('Sign in'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryOrange,
                  foregroundColor: primaryWhite),
              onPressed: () {},
              child: Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
