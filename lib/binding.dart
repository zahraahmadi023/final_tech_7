import 'package:final_tech_7/controller/register_controller.dart';
import 'package:final_tech_7/view/article/article_manager.dart';
import 'package:get/get.dart';

import 'controller/article_c/article_list_controller.dart';
import 'controller/article_c/singleInfo_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(
      ArticleController(),
    ); //permanent:true=>always or fals no alwys
    Get.lazyPut(() => SingleArticleController());
    // just when use need app
  }
}

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ManageArticle());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(
      RegisterController(),
    );
  }
}
