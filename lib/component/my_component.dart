import 'package:flutter/material.dart';

import '../models/fake_data.dart';
import 'myColor.dart';

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
                tagListName[index].title,
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ));
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: size.width / 1.16,
            height: size.height / 4.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(homePagePosterMap['imageAsset']),
                  fit: BoxFit.cover),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            )),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      homePagePosterMap['writer'] +
                          '' +
                          homePagePosterMap['date'],
                      style: textTheme.displayMedium),
                  Row(
                    children: [
                      Text(homePagePosterMap['view'],
                          style: textTheme.displayMedium),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        size: 14,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
              Text(homePagePosterMap['title'], style: textTheme.displayMedium)
            ],
          ),
        ),
      ],
    );
  }
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