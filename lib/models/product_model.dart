import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final dynamic price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );

    return product;
  }

  static List<Product> products = [
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
    const Product(
        name: "Coca Cola",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1629230151522-467018bde918?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=982&q=80",
        price: 4.55,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "Strawberry Smoothie",
        category: "Smoothies",
        imageUrl:
            "https://images.unsplash.com/photo-1553530666-ba11a7da3888?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3686&q=80",
        price: 9.99,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: "Aquafina",
        category: "Water",
        imageUrl:
            "https://images.unsplash.com/photo-1548839140-29a749e1cf4d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80",
        price: 20.5,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: "7UP",
        category: "Soft Drink",
        imageUrl:
            "https://images.unsplash.com/photo-1622766815178-641bef2b4630?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2419&q=80",
        price: 13.5,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: "Blueberrie",
        category: "Smoothies",
        imageUrl:
            "https://images.unsplash.com/photo-1615478503562-ec2d8aa0e24e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
        price: 7.00,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: "Sparkling water",
        category: "Water",
        imageUrl:
            "https://images.unsplash.com/photo-1624948465027-6f9b51067557?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3570&q=80",
        price: 2.00,
        isRecommended: false,
        isPopular: true),
  ];
}
