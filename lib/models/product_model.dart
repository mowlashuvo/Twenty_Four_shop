import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imgUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imgUrl,
        price,
        isRecommended,
        isPopular,
      ];

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
}
