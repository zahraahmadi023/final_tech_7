import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_tech_7/component/dimens.dart';
import 'package:final_tech_7/controller/article_c/singleInfo_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/my_component.dart';
import '../constant/myColor.dart';
import '../constant/myString.dart';
import '../controller/home_screen_controller.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required double bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    //homeScreenController.getHomeItems();
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.loading.value == false
              ? Obx(
                  () => Column(
                    children: [
                      poster(),
                      const SizedBox(
                        height: 10,
                      ),
                      homeTagList(),
                      const SizedBox(
                        height: 10,
                      ),
                      SeeMoreBlog(
                        bodyMargin: Dimens.bodyMargin,
                        textTheme: textTheme,
                        title: MyStrings.myFavBlog,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      topVisited(),

                      // const SizedBox(
                      //   height: 10,
                      // ),
                      SeeMorePadcast(
                          bodyMargin: Dimens.bodyMargin, textTheme: textTheme),
                      const SizedBox(
                        height: 10,
                      ),
                      podcastList(),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                )
              : Center(child: Loading())),
    );
  }

  Widget topVisited() {
    return SizedBox(
        height: size.height / 4,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVisiterdList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ///blogitem
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      singleArticleController.getSingleWithUserId(
                          homeScreenController.topVisiterdList[index].id!);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? Dimens.bodyMargin : 15),
                        child: SizedBox(
                          height: size.height / 5.8,
                          width: size.width / 2.5,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(homeScreenController
                                            .topVisiterdList[index].image!),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        homeScreenController
                                            .topVisiterdList[index].author!,
                                        style: textTheme.titleSmall),
                                    Row(
                                      children: [
                                        Text(
                                            homeScreenController
                                                .topVisiterdList[index].view!,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: index == 0 ? Dimens.bodyMargin : 15),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        homeScreenController.topVisiterdList[index].title!,
                        style: textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }

  Widget podcastList() {
    return SizedBox(
        height: size.height / 4,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topPodcastList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ///blogitem
              return Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? Dimens.bodyMargin : 15),
                      child: SizedBox(
                          height: size.height / 5.8,
                          width: size.width / 2.5,
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topPodcastList[index].poster!,
                            imageBuilder: ((context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            }),
                            placeholder: (context, url) => Loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                          )
                          // Stack(
                          //   children: [
                          //     Container(
                          //       decoration: BoxDecoration(
                          //           borderRadius: const BorderRadius.all(
                          //               Radius.circular(16)),
                          //           image: DecorationImage(
                          //               image: NetworkImage(homeScreenController
                          //                   .topPodcastList[index].poster!),
                          //               fit: BoxFit.cover)),
                          //     ),
                          //   ],
                          // ),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: index == 0 ? Dimens.bodyMargin : 15),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        homeScreenController.topPodcastList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
            width: size.width / 1.16,
            height: size.height / 4.2,
            child: CachedNetworkImage(
              imageUrl: homeScreenController.Poster.value.image!,
              fit: BoxFit.cover,
              imageBuilder: ((context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                );
              }),
              placeholder: (context, url) => Loading(),
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_outlined,
                size: 50,
                color: Colors.grey,
              ),
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
              Text(
                homeScreenController.Poster.value.title!,
                style: textTheme.displayMedium,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget homeTagList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, 8, index == 0 ? Dimens.bodyMargin : 15, 8),
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

class SeeMorePadcast extends StatelessWidget {
  const SeeMorePadcast({
    super.key,
    required this.textTheme,
    required double bodyMargin,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: Dimens.bodyMargin),
          child: const ImageIcon(
            AssetImage("assets/icons/blue_pen.png"),
            color: SolidColors.seeMore,
          ),
        ),
        const SizedBox(
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
