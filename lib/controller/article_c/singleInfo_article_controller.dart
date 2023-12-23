import 'package:final_tech_7/models/article_info_model.dart';
import 'package:final_tech_7/models/article_model.dart';
import 'package:get/get.dart';

import '../../models/TagModel.dart';
import '../../services/dio_services.dart';
import '../../view/article/single_info_screen.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  RxList<TagsModel> tagListId = RxList();
  RxList<ArticlModel> relatedList = RxList();
  Rx<ArticleInfoModel> articleInfoModel =
      ArticleInfoModel(null, null, null).obs;
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    //grtSingleWithUserId();
  }

  getSingleWithUserId(var id) async {
    articleInfoModel = ArticleInfoModel(null, null, null).obs;

    //int id to()
    loading.value = true;
    var userId = '';
    // print(ApiConstants.baseUrl +
    //     'article/get.php?command=info&id=$id&user_id=$userId');
    //TODO getUserId from getStrage ApiConstan+userid
    var respons = await DioServices().getMethode(
        'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=$id&user_id=$userId'
        // ApiConstants.baseUrl +
        // 'article/get.php?command=info&id=$id&user_id=$userId'
        );
    if (respons.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(respons.data);

      respons.data['tags'].forEach((element) {
        tagListId.add(TagsModel.fromJson(element));
      });

      respons.data['related'].forEach((element) {
        relatedList.add(ArticlModel.fromJson(element));
      });
      Get.to(SingleScreen());
      // Get.to(ArticleLIstScreen());
    }
    loading.value = false;
  }

  // respons.data['poster'];
  // print(respons.data['poster']['title']);
}
