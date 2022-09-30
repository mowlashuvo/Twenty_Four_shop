import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      centerTitle: true,
      title: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Text(
          '24/7',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.h);
}
