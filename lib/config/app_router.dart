import 'package:flutter/cupertino.dart';
import '../screen/screen.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings){
    print('this is route: ${settings.name}');
    switch (settings.name){
      case '/':
        HomeScreen.route();
        break;

    }
    return HomeScreen.route();
  }

}