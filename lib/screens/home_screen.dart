import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powermax/blocs/category/category_bloc.dart';
import 'package:powermax/blocs/product/product_bloc.dart';
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
      appBar: const CustomAppbar(title: 'Zero to Unicorn'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return const Text("Something went Wrong");
              }
            },
          ),
          //Recommended Products
          const SectionTitle(title: "RECOMANDED"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended == true)
                      .toList(),
                );
              } else {
                return const Text("Something Went Wrong");
              }
            },
          ),

          //Popular Products
          const SectionTitle(title: "POPULAR"),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular == true)
                      .toList(),
                );
              } else {
                return const Text("Something Went Wrong");
              }
            },
          ),
        ],
      ),
    );
  }
}
