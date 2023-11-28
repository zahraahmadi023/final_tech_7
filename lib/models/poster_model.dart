class PosterMoldel{
  String? id;
  String? title;
  String? image;
  PosterMoldel({
    required this.id,
    required this.title,
    required this.image,
    
  });
  PosterMoldel.fromJson(Map<String,dynamic> element){////element ==name evryThing is
    id=element["id"];
    title=element["title"];
    image=element["image"];
  }
  }