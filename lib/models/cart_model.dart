class CartItem {
  final String id;
  final dynamic price;
  final double? quantity;
  final String? title;
  final String? productId;

  CartItem({
    required this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  });
}
