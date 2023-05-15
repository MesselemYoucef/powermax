import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:powermax/blocs/cart/cart_bloc.dart';
import 'package:powermax/models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Text(
                    "$quantity",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
