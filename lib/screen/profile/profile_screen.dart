import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {


  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const[
        Center(child: Text('This Profile'))
      ],
    );
  }
}