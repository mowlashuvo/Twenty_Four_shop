import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const<Product>[]});

  double get subtotal => products.fold(0, (total, current) => total + current.price);

  double total (subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  double deliveryFee(subtotal){
    if(subtotal>=30){
      return 20.0;
    } else if (subtotal==0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal){
    if(subtotal>=30.0){
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add BDT ${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  // TODO: implement props
  List<Object?> get props => [products];

}