import 'package:final_tech_7/constant/api_constants.dart';
import 'package:final_tech_7/models/poster_model.dart';
import 'package:final_tech_7/services/dio_services.dart';
import 'package:get/get.dart';

import '../models/TagModel.dart';
import '../models/article_model.dart';
import '../models/topPodcast.dart';

class HomeScreenController extends GetxController {
  Rx<PosterMoldel> Poster = PosterMoldel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticlModel> topVisiterdList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var respons = await DioServices().getMethode(ApiUrlConstants.getHomeItem);
    if (respons.statusCode == 200) {
      respons.data['top_visited'].forEach((element) {
        topVisiterdList.add(ArticlModel.fromJson(element));
      });

      respons.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      Poster.value = PosterMoldel.fromJson(respons.data['poster']);

      respons.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });

      loading.value = false;
    }

    // respons.data['poster'];
    // print(respons.data['poster']['title']);
  }
}
