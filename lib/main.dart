import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/screen/screen.dart';

import 'blocs/bottom_nav/bottom_nav_bloc.dart';

void main() {
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
          // BlocProvider<CounterBloc>(
          //   create: (context) => CounterBloc(),
          // )
        ],
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          builder: (context, child) => const MaterialApp(
            // title: _title,
            // routeInformationParser: _appRouter.defaultRouteParser(),
            // routerDelegate: _appRouter.delegate(),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
        )
    );
  }
}
