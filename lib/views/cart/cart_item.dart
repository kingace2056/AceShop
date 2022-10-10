import 'package:aceshop/models/services/cart_services/cart_services.dart';
import 'package:aceshop/models/services/product_model/product_details_services.dart';
import 'package:aceshop/models/services/product_model/product_model.dart';
import 'package:aceshop/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:aceshop/constraints/constraints.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<CartItem> createState() => CartItemState();
}

class CartItemState extends State<CartItem> {
  int cartCount = 1;

  final ProductDetailServices productDetailServices = ProductDetailServices();
  final CartServices cartServices = CartServices();

  void increaseQuan(Product product) {
    cartServices.addToCart(context: context, product: product);
  }

  void decreaseQuan(Product product) {
    cartServices.decreaseFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final prodCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(prodCart['product']);
    final quantity = prodCart['quantity'];

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
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.images[0]))),
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
                                  decreaseQuan(product);
                                },
                                icon: Icon(Icons.remove)),
                            Text('$quantity'),
                            IconButton(
                                onPressed: () {
                                  increaseQuan(product);
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
