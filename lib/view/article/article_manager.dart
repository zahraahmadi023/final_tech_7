import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_tech_7/constant/myString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../component/my_component.dart';
import '../../controller/article_c/manage_article.dart';
import '../../gen/assets.gen.dart';
import '../../main.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  ManageArticleContriller manageArticleContriller =
      Get.put(ManageArticleContriller());
  //var manageArticleContriller = Get.put<ManageArticleContriller>;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 30),
          child: ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
              Size(Get.width / 3, 54),
            )),
            onPressed: () {
              Get.toNamed(NamdeRout.singleManageScreen);
            },
            child: const Text(
              'بریم برای نوشتن یک مقاله باحال  ',
            ),
          ),
        ),
        appBar: appBarNew('مدیریت مقاله ها '),
        body: Center(
          child: SizedBox(
            child: Obx(
              () => manageArticleContriller.loading.value
                  ? const Loading()
                  : manageArticleContriller.articleList.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: manageArticleContriller.articleList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: (() {
                                //rout singleManage
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
                                        imageUrl: manageArticleContriller
                                            .articleList[index].image!,
                                        imageBuilder:
                                            (((context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
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
                                              Icons
                                                  .image_not_supported_outlined,
                                              size: 20,
                                              color: Colors.grey);
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 2,
                                          child: Text(
                                            manageArticleContriller
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
                                              manageArticleContriller
                                                  .articleList[index].author!,
                                              style: textTheme.bodySmall,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                                manageArticleContriller
                                                        .articleList[index]
                                                        .view! +
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
                      : articleEmptyState(textTheme: textTheme),
            ),
          ),
        ),
      ),
    );
  }
}

// articleEmptyState(textTheme: textTheme),
class articleEmptyState extends StatelessWidget {
  const articleEmptyState({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.tcbot,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: MyStrings.ArticleManage, style: textTheme.bodyMedium)),
        ),
      ],
    );
  }
}
