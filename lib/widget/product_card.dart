import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5.w,
          height: 150.h,
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5.w - 10.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
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
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle, color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}