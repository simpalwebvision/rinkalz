class Order {
  final String orderNumber;
  final List<CartItem> items;
  final double total;
  final String shippingAddress;
  final String paymentMethod;

  Order({
    required this.orderNumber,
    required this.items,
    required this.total,
    required this.shippingAddress,
    required this.paymentMethod,
  });
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
