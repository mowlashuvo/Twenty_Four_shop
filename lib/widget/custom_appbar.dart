import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_four_shop/blocs/blocs.dart';
import 'package:twenty_four_shop/screen/wishlist/wishlist_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final int? index;

  const CustomAppBar({Key? key, required this.title, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: index == 1
          ? IconButton(
              onPressed: () {
                context.read<BottomNavigationBarBloc>().add(
                      const ChangeBottomNavigationBarEvent(index: 0),
                    );
              },
              icon: const Icon(Icons.chevron_left),
            )
          : index != null
              ? Container()
              : IconButton(
                  onPressed: () {
                    // if(index!=null){
                    //   AlertDialog(
                    //     title: Text('Are you sure?'),
                    //     content: Text('Do you want to exit an App'),
                    //     actions: <Widget>[
                    //       TextButton(
                    //         onPressed: () => Navigator.of(context).pop(false),
                    //         child: Text('No'),
                    //       ),
                    //       TextButton(
                    //         onPressed: () => Navigator.of(context).pop(true),
                    //         child: Text('Yes'),
                    //       ),
                    //     ],
                    //   );
                    // } else{
                    Navigator.pop(context);
                    // }
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
      centerTitle: true,
      title: Container(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.blue),
      actions: [
        index == 1
            ? IconButton(
                onPressed: () {
                  context
                      .read<BottomNavigationBarBloc>()
                      .add(const ChangeBottomNavigationBarEvent(index: 0));
                },
                icon: const Icon(Icons.shopping_bag))
            : Container(),
        title == 'Wishlist'
            ? Container()
            : IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, WishlistScreen.routeName);
                },
                icon: const Icon(Icons.favorite)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.h);
}
