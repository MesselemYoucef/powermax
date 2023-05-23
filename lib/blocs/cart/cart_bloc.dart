import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:powermax/models/cart_model.dart';
import 'package:powermax/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_cartStartedToState);
    on<CartProductAdded>(_cartProductAddedToState);
    on<CartProductRemoved>(_cartProductRemovedToState);
  }

  void _cartStartedToState(CartStarted event, Emitter<CartState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {}
  }

  void _cartProductAddedToState(
      CartProductAdded event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      emit(
        CartLoaded(
          cart: Cart(
              products: List.from(state.cart.products)..add(event.product)),
        ),
      );
    }
  }

  void _cartProductRemovedToState(
      CartProductRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      emit(
        CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        ),
      );
    }
  }
}
