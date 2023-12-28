import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final product;

  const ProductCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration:  BoxDecoration(boxShadow: const [BoxShadow(
        color: Color(0xffedeef5),
        blurRadius: 0,
        spreadRadius: 1,
        offset: Offset(0, 10),
      )],borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            product.price.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Center(
            child: Image.network(product.image, height: 175,colorBlendMode: BlendMode.overlay,),
          ),
        ],
      ),
    );
  }
}
