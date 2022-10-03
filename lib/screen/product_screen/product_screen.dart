import 'package:flutter/material.dart';
import 'package:twenty_four_shop/widget/widget.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen({Key? key}) : super(key: key);

  static const String routeName = '/product';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'product'),
      body: Text('this is'),
    );
  }
}

