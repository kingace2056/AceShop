import 'package:aceshop/models/constraints/constraints.dart';
import 'package:aceshop/models/services/auth_service.dart';
import 'package:aceshop/models/usermodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  bool isAdmin() {
    if (user.type == 'admin') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: defpad,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isAdmin() ? const Text('Admin Dashboard') : const SizedBox(),
              IconButton(
                onPressed: () {
                  AuthService().signOut(context: context);
                },
                icon: const Icon(
                  FontAwesomeIcons.signOut,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(80),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/surprised.png'))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: primaryBlk.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      user.email,
                      style: const TextStyle(color: primaryWhite, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '16',
                    style: TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    isAdmin() ? 'Orders' : 'My wishlist',
                    style: TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: 17),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '1',
                    style: TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  isAdmin()
                      ? SizedBox()
                      : Text(
                          'Vouchers',
                          style: TextStyle(
                              color: primaryWhite,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        )
                ],
              ),
              Column(
                children: [
                  Text(
                    '6',
                    style: TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    isAdmin() ? 'To Deliver' : 'Followed Stores',
                    style: TextStyle(
                        color: primaryWhite,
                        fontWeight: FontWeight.w300,
                        fontSize: 17),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
