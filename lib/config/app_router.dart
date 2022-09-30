import 'package:flutter/cupertino.dart';
import 'package:twenty_four_shop/main.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings){
    print('this is route: ${settings.name}');
    switch (settings.name){
      case '/':
        HomeScreen.route();
        break;
    }
  }

}