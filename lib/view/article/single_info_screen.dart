import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_tech_7/constant/myColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/my_component.dart';
import '../../controller/article_c/article_list_controller.dart';
import '../../controller/article_c/singleInfo_article_controller.dart';
import '../../gen/assets.gen.dart';

class SingleScreen extends StatelessWidget {
  //by use binding
  // var singleArticleController = Get.find<SingleArticleController>();
  //dont use binding
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  // @override
  // void initState() {
  //   super.initState();
  //   singleArticleController.getSingleWithUserId();
  // }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 14;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => singleArticleController.articleInfoModel.value.title == null
                ? Center(
                    child: SizedBox(height: Get.height, child: const Loading()))
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                " singleArticleController.articleInfoModel.value.image!",
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) {
                              return const Loading();
                            },
                            errorWidget: (context, url, error) {
                              return Assets.images.singlePlaceHolder.image();
                            },
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: GradientColors.singleAppbarGradiant,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                              ),
                              child: Row(children: const [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      Text(
                          singleArticleController.articleInfoModel.value.title!,
                          style: textTheme.bodyLarge),
                      Row(
                        children: [
                          Assets.images.avatar.image(height: 50),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                              singleArticleController
                                  .articleInfoModel.value.auther!,
                              style: textTheme.bodyMedium),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                              singleArticleController
                                  .articleInfoModel.value.createdAt!,
                              style: textTheme.bodyMedium),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                            text: singleArticleController
                                .articleInfoModel.value.content!,
                            style: textTheme.bodyMedium),
                      ),
                      // HtmlWidget(
                      //   '''
                      //   html
                      //   html
                      //   html cass
                      //   html
                      //   ''',
                      //   textStyle: textTheme.bodyMedium,
                      //   enableCaching: true,
                      //   onLoadingBuilder: (context, element, loadingProgress) => loading(),
                      // ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: singleArticleController.tagListId.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                var tagId = singleArticleController
                                    .tagListId[index].id!;
                                await Get.put(ArticleController())
                                    //Get.find<ArticleController>()
                                    .grtListArticleWithId(tagId);

                                //Get.to(ArticleLIstScreen());
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 8, index == 0 ? bodyMargin : 15, 8),
                                child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(22)),
                                        color: Colors.grey),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          const ImageIcon(
                                            AssetImage(
                                                "assets/icons/hashtagicon.png"),
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            singleArticleController
                                                .tagListId[index].title!,
                                            // Get.find<HomeScreenController>().tagList[index].title!,
                                            style: textTheme.titleSmall,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: size.height / 4,
                          child: Obx(
                            () => ListView.builder(
                              itemCount:
                                  singleArticleController.relatedList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                ///blogitem
                                return GestureDetector(
                                  onTap: () {
                                    singleArticleController.getSingleWithUserId(
                                        singleArticleController
                                            .relatedList[index].id!);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  index == 0 ? bodyMargin : 15),
                                          child: SizedBox(
                                            height: size.height / 5.8,
                                            width: size.width / 2.5,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  16)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              singleArticleController
                                                                  .relatedList[
                                                                      index]
                                                                  .image!),
                                                          fit: BoxFit.cover)),
                                                  foregroundDecoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          16)),
                                                          gradient: LinearGradient(
                                                              begin:
                                                                  Alignment
                                                                      .bottomCenter,
                                                              end: Alignment
                                                                  .topCenter,
                                                              colors:
                                                                  GradientColors
                                                                      .blogPost)),
                                                ),
                                                //////////bloglisy
                                                Positioned(
                                                  bottom: 5,
                                                  right: 5,
                                                  left: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('auther',
                                                          // singleArticleController
                                                          //     .relatedList[index].author!,
                                                          style: textTheme
                                                              .titleSmall),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              singleArticleController
                                                                  .relatedList[
                                                                      index]
                                                                  .view!,
                                                              style: textTheme
                                                                  .titleSmall),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .remove_red_eye_sharp,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                index == 0 ? bodyMargin : 15),
                                        child: SizedBox(
                                          width: size.width / 2.5,
                                          child: Text(
                                            singleArticleController
                                                .relatedList[index].title!,
                                            style: textTheme.bodySmall,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
