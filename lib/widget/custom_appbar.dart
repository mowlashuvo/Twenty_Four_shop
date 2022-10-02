import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/screen/wishlist/wishlist_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.chevron_left)),
      centerTitle: true,
      title: Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(
          color: Colors.blue
      ),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, WishlistScreen.routeName);
        }, icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.h);
}
