import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_tech_7/controller/article_c/article_list_controller.dart';
import 'package:final_tech_7/controller/article_c/singleInfo_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/my_component.dart';
import '../../main.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleController articleController = Get.put(ArticleController());

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBarNew('مقالات جدید '),
        body: SizedBox(
          child: Obx(
            () => !singleArticleController.loading.value
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articleController.articleList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: (() async {
                          await singleArticleController.getSingleWithUserId(
                              articleController.articleList[index].id);
                          Get.toNamed(NamdeRout.routSingleScreen);

                          // await singleArticleController.getArticleInfo(
                          //     listArticleController.articleList[index].id);
                          // Get.toNamed(NamedRoute.routeSingleArticle);
                        }),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height / 6,
                                width: Get.width / 3,
                                child: CachedNetworkImage(
                                  imageUrl: articleController
                                      .articleList[index].image!,
                                  imageBuilder: (((context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
                                    );
                                  })),
                                  placeholder: ((context, url) {
                                    return const Loading();
                                  }),
                                  errorWidget: ((context, url, error) {
                                    return const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 20,
                                        color: Colors.grey);
                                  }),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      articleController
                                          .articleList[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articleController
                                            .articleList[index].author!,
                                        style: textTheme.bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                          articleController
                                                  .articleList[index].view! +
                                              '  بازدید',
                                          style: textTheme.headlineSmall),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                : const Loading(),
          ),
        ),
      ),
    );

    //  SizedBox(
    //   child: Obx(
    //     () => ListView.builder(
    //       itemCount: articleController.articleList.length,
    //       scrollDirection: Axis.vertical,
    //       itemBuilder: (context, index) {
    //         return GestureDetector(
    //           onTap: () {
    //             //whene one post id
    //             // singleArticleController.grtSingleWithUserId(int.parse(
    //             //     articleController.articleList[index].id.toString()));

    //             // singleArticleController.id.value = int.parse(
    //             //     articleController.articleList[index].id.toString());
    //             singleArticleController.getSingleWithUserId(
    //                 articleController.articleList[index].id);
    //             Get.toNamed(NamdeRout.routSingleScreen);
    //           },
    //           child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SizedBox(
    //                     height: 130,
    //                     width: 150,
    //                     child: CachedNetworkImage(
    //                       imageUrl:
    //                           articleController.articleList[index].image!,
    //                       imageBuilder: (context, imageProvider) {
    //                         return Container(
    //                           decoration: BoxDecoration(
    //                               borderRadius: const BorderRadius.all(
    //                                   Radius.circular(16)),
    //                               image: DecorationImage(
    //                                   image: imageProvider,
    //                                   fit: BoxFit.cover)),
    //                         );
    //                       },
    //                       placeholder: (context, url) {
    //                         return const loading();
    //                       },
    //                       errorWidget: (context, url, error) {
    //                         return const Icon(
    //                           Icons.image_not_supported_outlined,
    //                           color: Colors.grey,
    //                           size: 50,
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     width: 10,
    //                   ),
    //                   Column(
    //                     //mainAxisAlignment: MainAxisAlignment.start,
    //                     //crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       SizedBox(
    //                         width: 230,
    //                         height: 60,
    //                         child: Text(
    //                           articleController.articleList[index].title!,
    //                           style: textTheme.bodyMedium,
    //                           overflow: TextOverflow.ellipsis,
    //                           maxLines: 2,
    //                         ),
    //                       ),
    //                       Row(
    //                         mainAxisAlignment:
    //                             MainAxisAlignment.spaceEvenly,
    //                         children: [
    //                           Text(
    //                             articleController
    //                                 .articleList[index].author!,
    //                             style: textTheme.headlineSmall,
    //                           ),
    //                           const SizedBox(
    //                             width: 50,
    //                           ),
    //                           Text(
    //                               articleController
    //                                       .articleList[index].view! +
    //                                   '  بازدید',
    //                               style: textTheme.headlineSmall),
    //                         ],
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               )),
    //         );
    //       },
    //     ),
    //   ),
    // ),
  }
}
