import 'dart:developer';

import 'package:final_tech_7/constant/api_constants.dart';
import 'package:final_tech_7/main.dart';
import 'package:final_tech_7/services/dio_services.dart';
import 'package:final_tech_7/view/main_screen.dart';
import 'package:final_tech_7/view/register_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/storage_const.dart';
import '../gen/assets.gen.dart';

class RegisterController extends GetxController {
//   // var email = '';
//   // var user_id = '';
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activaitCodeTextEditingController =
      TextEditingController();

//   ///ersal samt sarver
//   register() async {
//     Map<String, dynamic> map = {
//       'email': emailTextEditingController.text,
//       'command': 'register'
//     };
// ////
//     var respons =
//         await DioServices().PostMethod(map, ApiConstants.postRegyster);
//     // email = emailTextEditingController.text;
//     // user_id = respons.data["user_id"];

//     print(respons);
//   }

//   verify() async {
//     Map<String, dynamic> map = {
//       'email': 'amd.zi.co20@gmail.com',
//       'user_id': '307',
//       'code': activaitCodeTextEditingController.text,
//       'command': 'verify',
//     };
// ////
//     print('map..................');
//     print(map);
//     var respons =
//         await DioServices().PostMethod(map, ApiConstants.postRegyster);
//     print(respons.data);
//     print("respons.data");
//   }
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioServices().PostMethod(map, ApiUrlConstants.postRegyster);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activaitCodeTextEditingController.text,
      'command': 'verify'
    };
    var box = GetStorage();
    // print('map..................');
    // print(map);
    var respons =
        await DioServices().PostMethod(map, ApiUrlConstants.postRegyster);
    print(respons.data);
    var status = respons.data['response'];
    switch (status) {
      case 'verified':
        Get.snackbar('خطا', 'کد فعالسازی غلط است');
        // box.write(token, respons.data['verify']);
        // box.write(userId, respons.data['user_id']);

        // print("..........................object.......");
        // print(box.read(respons.data['user_id']));
        // Get.to(MainScreen());
        // Get.offAll(MainScreen());

        break;
      case 'incorrect_code':
        box.write(StorageKey.token, respons.data['verify']);
        box.write(StorageKey.userId, respons.data['user_id']);

        print("..........................object.......");
        print(box.read(respons.data['user_id']));
        Get.to(MainScreen());
        Get.offAll(MainScreen());

        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      print(GetStorage().read(StorageKey.token));
      Get.to(RegisterIntro());
    } else {
      // routoWrightBottomSheet();
      log('print log');
    }
  }

  routoWrightBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 80,
              ),
              const Text('دونسته  ها را با  بقیه به اشتراک بگذار '),
            ],
          ),
          const Text(
            '''
            فکر کن اینجا بودنت به این معناست که یک گیگ تکنولوژی هست
            ی که دونسته هاتو رو با جامعه ی گیگ های فارسی به امانت میزاری
''',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(NamdeRout.manageArticle);
                },
                child: Container(
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.mic_external_off,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text('مدیریت مقاله ها '),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.abc,
                        color: Colors.black,
                        size: 24,
                      ),
                      Text('مدیریت پادکست ها '),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
