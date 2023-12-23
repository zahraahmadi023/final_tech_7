import 'package:final_tech_7/constant/myColor.dart';
import 'package:final_tech_7/controller/register_controller.dart';
import 'package:final_tech_7/gen/assets.gen.dart';
import 'package:final_tech_7/view/my_categorys.dart';
import 'package:final_tech_7/view/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/dimens.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DioServices().getMethode(ApiConstant.getHomeIteme);
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    // List<Widget> techMainScreenPage = [

    // ];

    return SafeArea(
        child: Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(children: [
              DrawerHeader(
                  child: Center(
                child: Assets.images.logo.image(height: 64),
              )),
              ListTile(
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.bodyMedium,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  " درباره تکبلاگ ",
                  style: textTheme.bodyMedium,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  " اشتراک گذاری تک بلاگ ",
                  style: textTheme.bodyMedium,
                ),
                onTap: () {},
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  " تک بلاگ در گیت هاب ",
                  style: textTheme.bodyMedium,
                ),
                onTap: () {},
              ),
            ]),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            Assets.images.logo.image(height: size.height / 13.6),

            ///nesbat logo be safeh =>1964/144=13.6
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Obx(
          () => IndexedStack(
            index: selectedIndex.value,
            children: [
              homeScreen(
                  size: size,
                  textTheme: textTheme,
                  bodyMargin: Dimens.bodyMargin),
              ProfileScreen(
                  size: size,
                  textTheme: textTheme,
                  bodyMargin: Dimens.bodyMargin),
              MyCats(),
            ],
          ),
        )),
        BottomNavigation(
          size: size,
          changeScreen: (value) {
            selectedIndex.value = value;
          },
        )
      ]),
    ));
  }
}

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key, required this.size, required this.changeScreen});

  final Size size;
  final Function(int) changeScreen;

  //RegisterController _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: size.height / 11,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(colors: GradientColors.bottomNav)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  changeScreen(0);
                },
                icon: const ImageIcon(
                  color: Colors.white,
                  AssetImage(
                    "assets/icons/home.png",
                  ),
                ),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Get.find<RegisterController>().toggleLogin();
                  // Get.to(RegisterIntro());
                },
                icon: const ImageIcon(
                  AssetImage("assets/icons/write.png"),
                ),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  changeScreen(1);
                },
                icon: const ImageIcon(
                  AssetImage("assets/icons/user.png"),
                ),
              ),
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Get.find<RegisterController>().routoWrightBottomSheet();
                  },
                  icon: Icon(
                    Icons.picture_as_pdf_outlined,
                    size: 20,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
