

class PodcastModel{
  String? id;
  String? title; 
  String? poster; 
  String? catName; 
  String?author; 
  String? view;
    String? status; 
    String? createdAt;
    PodcastModel({
      required this.id,
      required this.title,
      required this.poster,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      required this.createdAt,
    });
    PodcastModel.fromJson(Map<String,dynamic> element){////element ==name evryThing is
    id=element["id"];
    title=element["title"]; 
  poster=element["poster"]; 
  catName=element["cat_name"]; 
  author=element["author"];
  view=element["view"];
  status=element["status"]; 
  createdAt=element["created_at"];

    }

}
  //  "id": "32",
  //           "title": "تست۳",
  //           "poster": "''",
  //           "cat_name": "آموزشی",
  //           "author": null,
  //           "view": "1",
  //           "status": "0",
  //           "created_at": "۱۴۰۲/۱/۲۸"
  //  "id": "32",
  //           "title": "تست۳",
  //           "poster": "''",
  //           "cat_name": "آموزشی",
  //           "author": null,
  //           "view": "1",
  //           "status": "0",
  //           "created_at": "۱۴۰۲/۱/۲۸"