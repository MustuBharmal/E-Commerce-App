import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ProductCard extends StatefulWidget {
  final product;

  const ProductCard(this.product, {super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isProduct = false;
  String? tempId;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).items;
    for (var item in cart.values) {
      if (widget.product.id.toString() == item.productId.toString()) {
        tempId = item.productId;
      }
    }
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color(0xffedeef5),
            blurRadius: 0,
            spreadRadius: 1,
            offset: Offset(0, 10)),
      ], borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              widget.product.image,
              colorBlendMode: BlendMode.overlay,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${widget.product.price.toString()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Text(
                    widget.product.rating.rate.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Icon(
                    Icons.star,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
