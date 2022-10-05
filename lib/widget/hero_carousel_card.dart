import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/models.dart';
import '../screen/screen.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;

  const HeroCarouselCard({Key? key, this.category, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(product==null){
          Navigator.pushNamed(
            context,
            CatalogScreen.routeName,
            arguments: category,
          );
        }

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 5.0.w),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
            child: Stack(
              children: <Widget>[
                Image.network(product == null ? category!.imgUrl : product!.imgUrl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.0.w),
                    child: Text(
                      product == null ? category!.name : '',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
