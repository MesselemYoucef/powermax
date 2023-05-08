import 'package:equatable/equatable.dart';
import 'package:powermax/models/product_model.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalToString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFeeToString => deliveryFee(subtotal).toStringAsFixed(2);

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return "You have free delivery";
    } else {
      double missing = 30.0 - subtotal;
      return "Add \$${missing.toStringAsFixed(2)} for FREE delivery";
    }
  }

  String get freereeDeliveryMessage => freeDelivery(subtotal);

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  List<Product> products = [
    const Product(
        name: "Pepsi",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1609347346277-f3abdf2f7106?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80",
        price: 7.6,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "Pepsi",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1609347346277-f3abdf2f7106?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80",
        price: 7.6,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "Mojito",
        category: "Smoothies",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675011400491-d94d368559fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2029&q=80",
        price: 8.90,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: "VOSS",
        category: "Water",
        imageUrl:
            "https://images.unsplash.com/photo-1550483455-c4a37c4973b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
        price: 3.56,
        isRecommended: true,
        isPopular: true),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
