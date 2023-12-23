import 'package:flutter/material.dart';

import '../component/my_component.dart';
import '../constant/myColor.dart';
import '../constant/myString.dart';
import '../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Assets.images.avatar.image(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageIcon(AssetImage("assets/icons/blue_pen.png"),
                color: SolidColors.seeMore),
            const SizedBox(
              width: 5,
            ),
            Text(
              MyStrings.imageProfileEdit,
              style: textTheme.displaySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          " فاطمه امیری ",
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          "fatemeh amiri@gmail.com",
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 40,
        ),
        Tec_Divider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: () {},
          child: const SizedBox(
              height: 45, child: Center(child: Text(MyStrings.myFavBlog))),
        ),
        Tec_Divider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: () {},
          child: const Center(
              child: SizedBox(
                  height: 45,
                  child: Center(child: Text(MyStrings.myFavPodcast)))),
        ),
        Tec_Divider(size: size),
        InkWell(
          splashColor: SolidColors.primaryColor,
          onTap: () {},
          child: const Center(
              child: SizedBox(
                  height: 45, child: Center(child: Text(MyStrings.logOut)))),
        ),
        const SizedBox(
          height: 60,
        )
      ],
    ));
  }
}
