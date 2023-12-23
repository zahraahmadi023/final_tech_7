import '../constant/api_constants.dart';

class PosterMoldel {
  String? id;
  String? title;
  String? image;
  PosterMoldel({
    this.id,
    this.title,
    this.image,
  });
  PosterMoldel.fromJson(Map<String, dynamic> element) {
    ////element ==name evryThing is
    id = element["id"];
    title = element["title"];
    image = ApiUrlConstants.hostUrl + element["image"];
  }
}
