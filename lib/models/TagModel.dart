class TagsModel{
  String? id;
  String? title; 
  
  TagsModel({
    required this.id,
    required this.title,
    
    
  });
  TagsModel.fromJson(Map<String,dynamic> element){////element ==name evryThing is
    id=element["id"];
    title=element["title"]; 
    
  }
  }