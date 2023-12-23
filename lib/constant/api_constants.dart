class ApiUrlConstants {
  static const baseUrl = 'https://techblog.sasansafari.com/Techblog/api/';
  static const hostUrl = 'https://techblog.sasansafari.com';
  //static const basUrl="https://techblog.sasansafari.com/Techblog/api/home/";
  static const getHomeItem =
      "https://techblog.sasansafari.com/Techblog/api/home/?command=index";
  static const getArticleList =
      'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=new&user_id=1';

  static const postRegyster =
      'https://techblog.sasansafari.com/Techblog/api/register/action.php';

  static const publishedByMe =
      'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=published_by_me&user_id=';
  static const articlePost =
      'https://techblog.sasansafari.com/Techblog/api/article/post.php';
}

class ApiKeyConstant {
  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const tagList = "tag_list";
  static const userId = "user_id";
  static const image = "image";
  static const command = "command";
}
