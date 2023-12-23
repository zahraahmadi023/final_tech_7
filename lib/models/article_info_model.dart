import '../constant/api_constants.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catName;
  String? catId;
  String? auther;
  String? view;
  String? statuse;
  String? createdAt;
  bool? isFavorite;
  ArticleInfoModel(this.title, this.content, this.image);

  ArticleInfoModel.fromJson(Map<String, dynamic> element) {
    //var info = element['info'];
    id = element['info']['id'];
    title = element['info']['title'];
    content = element['info']['content'];
    image = ApiUrlConstants.hostUrl + element['info']['image'];
    catName = element['info']['cat_name'];
    catId = element['info']['cat_id'];
    auther = element['info']['author'];
    view = element['info']['view'];
    statuse = element['info']['status'];
    createdAt = element['info']['created_at'];
    isFavorite = element['isFavorite'];
  }
}
