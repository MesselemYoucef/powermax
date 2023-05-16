import 'package:equatable/equatable.dart';
import 'package:powermax/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalToString => subtotal.toStringAsFixed(2);

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

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

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
