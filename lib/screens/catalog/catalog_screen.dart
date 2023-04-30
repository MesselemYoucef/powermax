import 'package:flutter/material.dart';
import 'package:powermax/models/models.dart';

import '../../widgets/widgets.dart';

class CatalogtScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  final Category category;
  const CatalogtScreen({required this.category});

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogtScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppbar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) => Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          ),
        ),
      ),
    );
  }
}
