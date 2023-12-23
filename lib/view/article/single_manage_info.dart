import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_tech_7/component/dimens.dart';
import 'package:final_tech_7/constant/myColor.dart';
import 'package:final_tech_7/controller/article_c/manage_article.dart';
import 'package:final_tech_7/controller/home_screen_controller.dart';
import 'package:final_tech_7/services/pick_file.dart';
import 'package:final_tech_7/view/article/html_content_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/my_component.dart';
import '../../controller/file_controller.dart';
import '../../gen/assets.gen.dart';

class SingleManageScreen extends StatelessWidget {
  FilePickerController filePickerController = Get.put(FilePickerController());
  ManageArticleContriller manageArticleContriller =
      Get.put(ManageArticleContriller());
  getTitle() {
    Get.defaultDialog(
        title: "عنوان مقاله",
        content: TextField(
            controller: manageArticleContriller.titleTextEditingController,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: SolidColors.colorTitle,
            ),
            decoration: const InputDecoration(
              hintText: 'اینجا بنویس',
            )),
        backgroundColor: SolidColors.primaryColor,
        confirm: ElevatedButton(
            onPressed: () {
              manageArticleContriller.upDateTitle();
              Get.back();
            },
            child: const Text("ثبت ")));
  }

  //by use binding
  // var singleArticleController = Get.find<SingleArticleController>();
  //dont use binding

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
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 3,
                      child: filePickerController.file.value.name == 'nothing'
                          ? CachedNetworkImage(
                              imageUrl:
                                  " singleArticleController.articleInfoModel.value.image!",
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        // fit: BoxFit.cover
                                      )),
                                );
                              },
                              placeholder: (context, url) {
                                return const Loading();
                              },
                              errorWidget: (context, url, error) {
                                return Assets.images.singlePlaceHolder.image();
                              },
                            )
                          : Image.file(
                              File(filePickerController.file.value.path!),
                              fit: BoxFit.cover,
                            ),
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
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ]),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              pickFils();
                            },
                            child: Container(
                              height: 40,
                              width: 110,
                              decoration: const BoxDecoration(
                                  color: SolidColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      topRight: Radius.circular(14))),
                              child: Row(children: const [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  "انتخاب تصویر ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ]),
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    getTitle();
                  },
                  child: SeeMoreBlog(
                      title: 'ویرایش عنوان مقاله',
                      bodyMargin: bodyMargin,
                      textTheme: textTheme),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(manageArticleContriller.articleInfoModel.value.title!,
                    style: textTheme.bodyLarge),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => ArticleContentEditor()),
                  child: SeeMoreBlog(
                      title: 'ویرایش متن اصلی مقاله',
                      bodyMargin: bodyMargin,
                      textTheme: textTheme),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.bodyMargin),
                  child: RichText(
                    text: TextSpan(
                        text: manageArticleContriller
                            .articleInfoModel.value.content!,
                        style: textTheme.bodyMedium),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    chooseCatBottomSheet(textTheme);
                  },
                  child: SeeMoreBlog(
                      title: 'انتخاب  دسته بندی ',
                      bodyMargin: bodyMargin,
                      textTheme: textTheme),
                ),
                Text(
                    manageArticleContriller.articleInfoModel.value.catName ==
                            null
                        ? "متنی وجود ندارد "
                        : manageArticleContriller
                            .articleInfoModel.value.catName!,
                    style: textTheme.bodyLarge),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async =>
                        await manageArticleContriller.storeArticle(),
                    child: Text(manageArticleContriller.loading.value
                        ? 'صبر کنید...'
                        : "ارسال مطلب "))
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseCatBottomSheet(TextTheme textTheme) {
    Get.bottomSheet(
      Container(
        height: Get.height / 4,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("انتخاب دسته بندی"),
              const SizedBox(
                height: 20,
              ),
              cats(textTheme),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      //persistent: true,
    );
  }

  Widget cats(TextTheme textTheme) {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      height: 60,
      // Get.height / 1.8,
      child: ListView.builder(
        itemCount: homeScreenController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticleContriller.articleInfoModel.update((val) {
                val?.catId = homeScreenController.tagList[index].id!;
                val?.catName = homeScreenController.tagList[index].title!;
              });
              manageArticleContriller.articleInfoModel.value.catName =
                  homeScreenController.tagList[index].title!;
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 3,
              ),
              child: Container(
                  height: 10,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: SolidColors.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        homeScreenController.tagList[index].title!,
                        // Get.find<HomeScreenController>().tagList[index].title!,
                        style: textTheme.titleSmall,
                      ),
                    ),
                  )),
            ),
          );
        },
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3, mainAxisExtent: 5, crossAxisSpacing: 5),
      ),
    );
  }
}
