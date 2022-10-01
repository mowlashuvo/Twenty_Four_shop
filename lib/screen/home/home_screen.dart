import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenty_four_shop/screen/second_page.dart';
import 'package:twenty_four_shop/widget/widget.dart';

import '../../blocs/blocs.dart';
import '../first_page.dart';


class HomeScreen extends StatelessWidget {


  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex=0;
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {
        _selectedIndex = state.tabIndex;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Successfully incremented ${_selectedIndex}'),
          duration: Duration(milliseconds: 300),
        ));
      },
      builder: (context, state) {
        return Scaffold(
            appBar: const CustomAppBar(title: '24/7 Grocery Shop'),
            body: _selectedIndex==0?FirstPage():_selectedIndex==1?SecondPage():FirstPage(),
            bottomNavigationBar: CustomNavigationBar(selectedIndex: _selectedIndex)
        );
      },
    );
  }
}

