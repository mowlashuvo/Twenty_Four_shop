import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key, required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20.0.w,
            vertical: 10.0.h,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 5.0.h),
              child: ProductCard(product: products[index]),
            );
          }),
    );
  }
}