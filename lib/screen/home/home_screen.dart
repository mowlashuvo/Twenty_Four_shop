import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentBackPressTime = DateTime.now();
    Future<bool> onWillPop() {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Press again to exit!'),
          duration: Duration(milliseconds: 300),
        ));
        return Future.value(false);
      }
      return Future.value(true);
    }
    return WillPopScope(
      onWillPop: onWillPop,
      child: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height
            ),
            items: Category.categories
                .map((category) => HeroCarouselCard(category: category))
                .toList(),
          ),
          const SectionTitle(title: 'RECOMMENDED'),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList()),
          const SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
