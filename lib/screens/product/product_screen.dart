import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powermax/blocs/cart/cart_bloc.dart';
import 'package:powermax/blocs/wishlist/wishlist_bloc.dart';
import 'package:powermax/models/product_model.dart';

import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;
  const ProductScreen({super.key, required this.product});

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));
                      const snackBar =
                          SnackBar(content: Text("Added to your wishlist"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
            autoPlay: false,
          ),
          items: [
            HeroCarouselCard(product: product),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                height: 60,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                margin: const EdgeInsets.all(5.0),
                height: 50,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "\$${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              "Product Information",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            children: [
              ListTile(
                title: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In posuere dapibus nisl. Nunc quis lectus velit. Proin dui libero, aliquam et rhoncus vitae, finibus a magna. Nunc aliquet quis velit eu condimentum. Curabitur interdum leo vel maximus vestibulum. Etiam nec nisi id erat volutpat euismod. Etiam tincidunt diam et diam porta",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            title: Text(
              "Delivery Information",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            children: [
              ListTile(
                title: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In posuere dapibus nisl. Nunc quis lectus velit. Proin dui libero, aliquam et rhoncus vitae, finibus a magna. Nunc aliquet quis velit eu condimentum. Curabitur interdum leo vel maximus vestibulum. Etiam nec nisi id erat volutpat euismod. Etiam tincidunt diam et diam porta",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
