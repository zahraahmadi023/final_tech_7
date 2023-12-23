import 'package:final_tech_7/component/my_component.dart';
import 'package:final_tech_7/controller/article_c/manage_article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleContriller = Get.put(ManageArticleContriller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.clearFocus();
      },
      child: Scaffold(
        appBar: appBarNew("نوشتن /ویرایش متن "),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                  controller: controller,
                  htmlEditorOptions: HtmlEditorOptions(
                      hint: ' میتونی مقالتو اینجا بنویسی....',
                      shouldEnsureVisible: true,
                      initialText: manageArticleContriller
                          .articleInfoModel.value.content!),
                  callbacks: Callbacks(
                    onChangeContent: (p0) {
                      manageArticleContriller.articleInfoModel.update((val) {
                        val?.content = p0;
                      });

                      // logger.t(manageArticleContriller
                      //     .articleInfoModel.value.content
                      //     .toString());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
