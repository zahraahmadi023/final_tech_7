import 'package:get/get.dart';

import '../../constant/api_constants.dart';
import '../../models/article_model.dart';
import '../../services/dio_services.dart';

class ArticleController extends GetxController {
  RxList<ArticlModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    grtList();
  }

  grtList() async {
    loading.value = true;
    //TODO getUserId from getStrage ApiConstan+userid
    var respons =
        await DioServices().getMethode(ApiUrlConstants.getArticleList);
    if (respons.statusCode == 200) {
      respons.data.forEach((element) {
        articleList.add(ArticlModel.fromJson(element));
      });
      loading.value = false;
    }

    // respons.data['poster'];
    // print(respons.data['poster']['title']);
  }

  grtListArticleWithId(String id) async {
    articleList.clear();
    loading.value = true;
    //TODO getUserId from getStrage ApiConstan+userid
    var respons = await DioServices().getMethode(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (respons.statusCode == 200) {
      respons.data.forEach((element) {
        articleList.add(ArticlModel.fromJson(element));
      });
      loading.value = false;
    }

    // respons.data['poster'];
    // print(respons.data['poster']['title']);
  }
}
