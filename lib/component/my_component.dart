import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../models/fake_data.dart';
import '../view/article/articl_list_screen.dart';
import '../controller/home_screen_controller.dart';
import '../constant/myColor.dart';
import '../constant/myString.dart';
import 'text_style.dart';

class Tec_Divider extends StatelessWidget {
  const Tec_Divider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class TageList extends StatelessWidget {
  final TextTheme textTheme;
  final int index;

  TageList({
    required this.index,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradientColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage("assets/icons/hashtagicon.png"),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              tagListName[index].title,
              style: textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              const ImageIcon(
                AssetImage("assets/icons/hashtagicon.png"),
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'text',
                //   Get.find<HomeScreenController>().tagList[index].title!,
                // homeScreenController.tagList[index].title!,
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ));
  }
}

PreferredSize appBarNew(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(90),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: appBarStyle,
            )),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                color: SolidColors.primaryColor, shape: BoxShape.circle),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.keyboard_arrow_right)),
          ),
        ),
      ),
    ),
  );
}

////////////////
// MylaunchUrl(String url)async{
//   var uri=Uri.parse(url);
//   if(await canLaunchUrl(uri)){
//     await launchUrl(uri);
//   }else{
//     print("object");
//     //log("cannot in ${uri.toString()}");
//   }

//}
class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  String title;
  SeeMoreBlog({
    super.key,
    required this.title,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.to(ArticleListScreen()),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin),
            child: const ImageIcon(
              AssetImage("assets/icons/blue_pen.png"),
              color: SolidColors.seeMore,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: textTheme.displaySmall,
        )
      ],
    );
  }
}
