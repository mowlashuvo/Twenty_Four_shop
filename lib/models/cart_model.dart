import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal => products.fold(0, (total, current) => total + current.price);

  double total (subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  double deliveryFee(subtotal){
    if(subtotal>=30){
      return 20.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal){
    if(subtotal>=30.0){
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add BDT ${missing.toStringAsFixed(2)}';
    }
  }

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  static List<Product> products = [
    const Product(
      name: 'Coca Cola',
      category: 'Soft Drink',
      imgUrl:
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 35.00,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Pepsi',
      category: 'Soft Drink',
      imgUrl:
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 35.00,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Soda',
      category: 'Soft Drink',
      imgUrl:
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      price: 35.00,
      isRecommended: true,
      isPopular: true,
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [];

}