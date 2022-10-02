import 'package:flutter/material.dart';


class CatalogScreen extends StatelessWidget {


  const CatalogScreen({Key? key}) : super(key: key);

  static const String routeName = '/catalog';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CatalogScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const[
        Center(child: Text('This is catalog')),
      ],
    );
  }
}

