class CartManager {
  static final List<Map<String, dynamic>> _cartItems = [];

  static List<Map<String, dynamic>> get cartItems => _cartItems;

  static void addToCart(Map<String, dynamic> product, {String? size}) {
    final selectedSize = size ?? product['size'] ?? "Free Size";
    final productId = "${product['id'] ?? product['title']}_$selectedSize";

    final existingItem = _cartItems.firstWhere(
      (item) => item['id'] == productId,
      orElse: () => {},
    );

    if (existingItem.isNotEmpty) {
      existingItem['quantity'] += 1;
    } else {
      final newProduct = Map<String, dynamic>.from(product);
      newProduct['id'] = productId;
      newProduct['size'] = selectedSize;
      newProduct['quantity'] = 1;
      _cartItems.add(newProduct);
    }
  }

  static void increaseQuantity(String productId) {
    final item = _cartItems.firstWhere((item) => item['id'] == productId);
    item['quantity'] += 1;
  }

  static void decreaseQuantity(String productId) {
    final index = _cartItems.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      if (_cartItems[index]['quantity'] > 1) {
        _cartItems[index]['quantity'] -= 1;
      } else {
        _cartItems.removeAt(index);
      }
    }
  }

  static void updateSize(String productId, String newSize) {
    final index = _cartItems.indexWhere((item) => item['id'] == productId);
    if (index != -1) {
      _cartItems[index]['size'] = newSize;
      _cartItems[index]['id'] = "${_cartItems[index]['title']}_$newSize";
    }
  }

  static double getTotalAmount() {
    return _cartItems.fold(0, (total, item) {
      final double price =
          double.tryParse(
            item['price'].toString().replaceAll(RegExp(r'[^0-9]'), ''),
          ) ??
          0;
      return total + (price * item['quantity']);
    });
  }
}
