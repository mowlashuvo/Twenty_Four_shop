import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/simple_bloc_observer.dart';
import '../config/app_router.dart';
import '../config/theme.dart';
import '../screen/screen.dart';
import 'blocs/blocs.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationBarBloc>(
            create: (context) => BottomNavigationBarBloc(),
          ),
          BlocProvider<WishlistBloc>(
            create: (context) => WishlistBloc()..add(StartWishlist()),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc()..add(CartStarted()),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (context, child) => MaterialApp(
            title: '24/7 Grocery Shop',
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
            debugShowCheckedModeBanner: false,
          ),
        )
    );
  }
}
