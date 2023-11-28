import 'package:flutter/material.dart';

import '../component/myColor.dart';
import '../component/myString.dart';
import '../component/my_component.dart';
import '../models/fake_data.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            HomePageTageList(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            homePageBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            SeeMorePadcast(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            HomePagePodcastList(size: size, bodyMargin: bodyMargin),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 4,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            ///blogitem
            return Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: SizedBox(
                      height: size.height / 5.8,
                      width: size.width / 2.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(blogList[index].imageUrl),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: Text(
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

class SeeMorePadcast extends StatelessWidget {
  const SeeMorePadcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: bodyMargin),
          child: const ImageIcon(
            AssetImage("assets/icons/blue_pen.png"),
            color: SolidColors.seeMore,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          MyStrings.myFavPodcast,
          style: textTheme.displaySmall,
        )
      ],
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height / 4,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            ///blogitem
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: SizedBox(
                      height: size.height / 5.8,
                      width: size.width / 2.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(blogList[index].imageUrl),
                                    fit: BoxFit.cover)),
                            foregroundDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: GradientColors.blogPost)),
                          ),
                          //////////bloglisy
                          Positioned(
                            bottom: 5,
                            right: 5,
                            left: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(blogList[index].writer,
                                    style: textTheme.titleSmall),
                                Row(
                                  children: [
                                    Text(blogList[index].views,
                                        style: textTheme.titleSmall),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: Text(
                      blogList[index].title,
                      style: textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: bodyMargin),
          child: const ImageIcon(
            AssetImage("assets/icons/blue_pen.png"),
            color: SolidColors.seeMore,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          MyStrings.myFavBlog,
          style: textTheme.displaySmall,
        )
      ],
    );
  }
}

class HomePageTageList extends StatelessWidget {
  const HomePageTageList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTags(
              textTheme: textTheme,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
