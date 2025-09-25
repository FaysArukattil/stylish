class OrderManager {
  static final List<Map<String, dynamic>> _orders = [];

  static List<Map<String, dynamic>> get orders => _orders;

  static void addOrder(
    List<Map<String, dynamic>> items,
    double totalAmount,
    String paymentMethod,
  ) {
    _orders.add({
      "items": List<Map<String, dynamic>>.from(items), // deep copy
      "total": totalAmount,
      "paymentMethod": paymentMethod,
      "date": DateTime.now().toString(),
    });
  }
}
