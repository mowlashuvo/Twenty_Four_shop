import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screen/screen.dart';
import '../../widget/widget.dart';
import '../../blocs/blocs.dart';


class DashboardScreen extends StatelessWidget {


  const DashboardScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {
        selectedIndex = state.tabIndex;
      },
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBar(title: selectedIndex==0?'24/7 Grocery Shop':selectedIndex==1?'Cart':'Profile', index: selectedIndex),
            body: selectedIndex==0?const HomeScreen():selectedIndex==1?const CartScreen():const ProfileScreen(),
            bottomNavigationBar: selectedIndex==1?const BottomAppBar() : CustomNavigationBar(selectedIndex: selectedIndex)
        );
      },
    );
  }
  Future<void> resetIsBackPressed(bool isBackPressed) async {
    await Future<void>.delayed(const Duration(seconds: 10));
    if(isBackPressed){
      isBackPressed = false;
    }
  }
}