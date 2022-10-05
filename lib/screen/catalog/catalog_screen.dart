import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/models.dart';
import '../../widget/widget.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0.w,
            vertical: 16.0.h,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            );
          }),
      //
    );
  }
}
