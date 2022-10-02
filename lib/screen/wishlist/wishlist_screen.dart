import 'package:flutter/material.dart';
import 'package:twenty_four_shop/widget/widget.dart';


class WishlistScreen extends StatelessWidget {

  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Wishlist'),
        body: Text('this is'),
    );
  }
}

