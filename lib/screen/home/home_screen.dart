import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:twenty_four_shop/models/models.dart';
import 'package:twenty_four_shop/widget/widget.dart';

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
    return ListView(
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
    );
  }
}
