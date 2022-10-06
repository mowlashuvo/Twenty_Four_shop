import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/blocs.dart';
import '../../widget/widget.dart';

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
      context.read<BottomNavigationBarBloc>().add(
            const ChangeBottomNavigationBarEvent(index: 0),
          );
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 18.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              state.cart.freeDeliveryString,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<BottomNavigationBarBloc>().add(
                                    const ChangeBottomNavigationBarEvent(
                                        index: 0));
                              },
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
                        SizedBox(
                          height: 480.w,
                          child: ListView.builder(
                            itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                              );
                            },
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SUBTOTAL',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    'BDT ${state.cart.subtotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DELIVERY FEE',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    'BDT ${state.cart.deliveryFeeString}',
                                    style:
                                        Theme.of(context).textTheme.headline5,
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
                                padding:
                                    EdgeInsets.symmetric(horizontal: 30.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      'BDT ${state.cart.totalString}',
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
              );
            } else {
              return Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.headline3,
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
