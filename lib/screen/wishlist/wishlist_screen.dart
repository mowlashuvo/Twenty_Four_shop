import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/blocs/blocs.dart';
import 'package:twenty_four_shop/widget/widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final List<Product> categoryProducts = Product.products
    //     .where((product) => product.category == category.name)
    //     .toList();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wishlist'),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistLoaded) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                  vertical: 16.0.h,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: state.wishlist.products[index],
                    widthFactor: 0.9,
                    leftPosition: 15.0,
                    isWishlist: true,
                  );
                });
          } else {
            return Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.headline1,
            );
          }
        },
      ),
    );
  }
}
