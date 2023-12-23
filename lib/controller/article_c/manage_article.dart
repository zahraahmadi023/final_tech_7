import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:final_tech_7/constant/commands.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/api_constants.dart';
import '../../constant/storage_const.dart';
import '../../models/article_info_model.dart';
import '../../models/article_model.dart';
import '../../services/dio_services.dart';
import '../file_controller.dart';

class ManageArticleContriller extends GetxController {
  RxList articleList = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          'اینجا عنوان مقاله قرار میگیرد یه عنوان جذاب انتخاب کن ',
          '''
من متن و بدنه اصلی مقاله هستم ،اگر میخای منو ویرایش کنی
یه مقاله جذاب بنویسی نوشته ابی رنگ  بالا را کلیک کن تا ویرایشگر متن برات باز بشه
''',
          '')
      .obs;
  // var userId = '1';
  upDateTitle() {
    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  storeArticle() async {
    var fileController = Get.find<FilePickerController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiKeyConstant.title: articleInfoModel.value.title,
      ApiKeyConstant.content: articleInfoModel.value.content,
      ApiKeyConstant.catId: articleInfoModel.value.catId,
      ApiKeyConstant.userId: GetStorage().read(StorageKey.userId),
      ApiKeyConstant.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiKeyConstant.command: Commands.Store,
      ApiKeyConstant.tagList: "[]"
    };
    var response =
        await DioServices().PostMethod(map, ApiUrlConstants.articlePost);
    log(response.data.toString());
    loading.value = false;
  }

  @override
  onInit() {
    super.onInit();

    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    //TODO getUserId from getStrage ApiConstan+userid
    var respons =
        await DioServices().getMethode(ApiUrlConstants.publishedByMe + '1'
            //GetStorage().read(StorageKey.userId
            //)
            );
    if (respons.statusCode == 200) {
      respons.data.forEach((element) {
        articleList.add(ArticlModel.fromJson(element));
      });
      //articleList.clear();
      loading.value = false;
    }
  }
}
