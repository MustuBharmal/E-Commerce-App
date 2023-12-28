import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final dynamic price;
  final double quantity;
  final String title;
  final dynamic productId;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(
                  child: Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
                ),
              ),
            ),
            title: Text(title,),
            subtitle: Text('Total: \$${(price * quantity)}', style: Theme.of(context).textTheme.bodySmall,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${quantity.toInt()} x',style: Theme.of(context).textTheme.bodySmall,),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeSingleItem(productId);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
