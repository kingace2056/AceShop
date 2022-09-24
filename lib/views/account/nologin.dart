import 'package:aceshop/models/constraints/constraints.dart';
import 'package:flutter/material.dart';

class AccountNotLoggedIn extends StatelessWidget {
  const AccountNotLoggedIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary, foregroundColor: primaryWhite),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text('Sign in'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryOrange,
                  foregroundColor: primaryWhite),
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
