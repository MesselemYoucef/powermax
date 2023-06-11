import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:powermax/models/models.dart';
import 'package:powermax/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>(_mapLoadProductsToState);
    on<UpdateProducts>(_mapUpdateProductsTostate);
  }

  void _mapLoadProductsToState(LoadProducts event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(UpdateProducts(products)),
        );
    emit(const ProductLoaded());
  }
}

void _mapUpdateProductsTostate(
    UpdateProducts event, Emitter<ProductState> emit) {
  emit(
    ProductLoaded(products: event.products),
  );
}
