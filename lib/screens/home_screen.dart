import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/widgets.dart';
import 'package:powermax/models/models.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Zero to Unicorn'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: false,
                autoPlay: false,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
          ),
          //Recommended Products
          const SectionTitle(title: "RECOMANDED"),
          ProductCarousel(products: Product.products.where((product) => product.isRecommended == true).toList()),
          //Popular Products
          const SectionTitle(title: "POPULAR"),
          ProductCarousel(products: Product.products.where((product) => product.isPopular == true).toList()),
        ],
      ),
    );
  }
}

