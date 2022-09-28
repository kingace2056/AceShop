import 'package:flutter/material.dart';
import 'package:aceshop/constraints/constraints.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => CartItemState();
}

class CartItemState extends State<CartItem> {
  int cartCount = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(value: false, groupValue: false, onChanged: (value) {}),
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.height * 0.11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://picsum.photos/200/300'))),
            ),
            const SizedBox(
              width: 2,
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.11,
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: const Text(
                        'FANTECH THOR X9 GAMING MOUSE 45000 DPI',
                        style: TextStyle(
                            color: primaryBlk,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: const Text(
                        'This is product description and i think it doesnt even matters ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: secDarkGrey),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text(
                          'Rs 3000',
                          style: TextStyle(
                              color: primaryOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartCount--;
                                  });
                                },
                                icon: Icon(Icons.remove)),
                            Text('$cartCount'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    cartCount++;
                                  });
                                },
                                icon: Icon(Icons.add)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
