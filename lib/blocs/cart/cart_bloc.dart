import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twenty_four_shop/models/cart_model.dart';
import 'package:twenty_four_shop/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartLoaded());
  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCardProductAddedToState(event, state);
    } else if (event is CartProductRemove) {
      yield* _mapCartProductRemoveToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapCardProductAddedToState(
      CartProductAdded event,
      CartState state,
      ) async* {
    if(state is CartLoaded){
      try {
        yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..add(event.product)));
      } catch (_){}
    }
  }
  Stream<CartState> _mapCartProductRemoveToState(
      CartProductRemove event,
      CartState state,
      ) async* {
    if(state is CartLoaded){
      try {
        yield CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product)));
      } catch (_){}
    }
  }
}
