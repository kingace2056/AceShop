import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aceshop/constraints/constraints.dart';

class SellerBadge extends StatelessWidget {
  const SellerBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defpad,
      decoration: BoxDecoration(
        color: labelBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://picsum.photos/200/300'),
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Store Name',
                style: TextStyle(
                    color: primaryBlk,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'AceShop Verified',
                    style: TextStyle(
                        // color: primaryBlk,
                        // fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.verified_user_rounded,
                    color: primary,
                    size: 15,
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Icon(
            CupertinoIcons.right_chevron,
            color: secDarkGrey,
          )
        ],
      ),
    );
  }
}
