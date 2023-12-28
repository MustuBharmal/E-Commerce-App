import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/product_provider.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false).items;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          sliver: SliverWaterfallFlow(
            gridDelegate:
                const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final prod = product[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: prod);
                        },
                      ),
                    );
                  },
                  child: ProductCard(prod),
                );
              },
              childCount: product.length,
            ),
          ),
        ),
      ],
    );
  }
}
