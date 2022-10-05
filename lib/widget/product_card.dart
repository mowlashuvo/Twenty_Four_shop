import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';
import '../screen/screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: product,
        );
      },
      child: Stack(
        children: [
          SizedBox(
            width: widthValue.w,
            height: 150.h,
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue.w - 5.w - leftPosition,
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue.w - 15.w - leftPosition,
              height: 70.h,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Added to your cart!'),
                                  duration: Duration(milliseconds: 300),
                                ));
                                context.read<CartBloc>().add(CartProductAdded(product));
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                        else {
                          return Text('Something Went Wrong');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
