class Order {
  final String name;
  final String product;
  final String variation;
  final int quantity;
  final int price;
  final String status;
  final String deliveryService;
  final String orderNumber;

  Order({
    required this.name,
    required this.product,
    required this.variation,
    required this.quantity,
    required this.price,
    required this.status,
    required this.deliveryService,
    required this.orderNumber,
  });
}
