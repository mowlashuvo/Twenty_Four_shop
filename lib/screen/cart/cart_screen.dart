import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/blocs/blocs.dart';
import 'package:twenty_four_shop/screen/dashboard/dashboard_screen.dart';
import 'package:twenty_four_shop/screen/home/home_screen.dart';
import 'package:twenty_four_shop/widget/widget.dart';

import '../../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      // return (await showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text('Are you sure?'),
      //     content: Text('Do you want to exit an App'),
      //     actions: <Widget>[
      //       TextButton(
      //         onPressed: () => Navigator.of(context).pop(false),
      //         child: Text('No'),
      //       ),
      //       TextButton(
      //         onPressed: () => Navigator.of(context).pop(true),
      //         child: Text('Yes'),
      //       ),
      //     ],
      //   ),
      // ))
      // Navigator.pushNamed(context, DashboardScreen.routeName);
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     DashboardScreen.routeName, (Route<dynamic> route) => false);
      context
          .read<BottomNavigationBarBloc>()
          .add(const ChangeBottomNavigationBarEvent(index: 0));
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 18.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add BDT 20.0 for free delivery',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(),
                            elevation: 0),
                        child: Text(
                          'Add More Items',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CartProductCard(
                    product: Product.products[0],
                  ),
                  CartProductCard(
                    product: Product.products[0],
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    thickness: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0.h,
                      horizontal: 40.0.h,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUBTOTAL',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'BDT 20',
                              style: Theme.of(context).textTheme.headline5,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY FEE',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'BDT 20',
                              style: Theme.of(context).textTheme.headline5,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(50),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 5.0.w,
                        ),
                        height: 50.h,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                'BDT 20',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text(
              'GO TO CHECKOUT',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
