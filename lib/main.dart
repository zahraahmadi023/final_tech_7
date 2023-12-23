import 'dart:io';

import 'package:final_tech_7/binding.dart';
import 'package:final_tech_7/my_http_client.dart';
import 'package:final_tech_7/view/article/article_manager.dart';
import 'package:final_tech_7/view/article/single_info_screen.dart';
import 'package:final_tech_7/view/main_screen.dart';
import 'package:final_tech_7/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

import 'constant/myColor.dart';
import 'view/article/single_manage_info.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      /////////////////////////////////navigation//////////////
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark);
  await GetStorage.init();

  ///
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(
              name: NamdeRout.routMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinding()),
          GetPage(
              name: NamdeRout.routSingleScreen,
              page: () => SingleScreen(),
              binding: ArticleBinding()),
          GetPage(
              name: NamdeRout.manageArticle,
              page: () => ManageArticle(),
              binding: ManageArticleBinding()),
          GetPage(
              name: NamdeRout.singleManageScreen,
              page: () => SingleManageScreen(),
              binding: ManageArticleBinding())
        ],
        locale: const Locale('fa'),
        // debugShowCheckedModeBanner: false,
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('fa'), // farsi
        // ],
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(width: 2)),
              filled: true,
              fillColor: Colors.white),

          //////////////////////////button
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return TextStyle(fontSize: 25);
              }
              return TextStyle(fontSize: 15);
            }), backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            })),
          ),

          fontFamily: 'DANA',
          // ignore: prefer_const_constructors
          textTheme: TextTheme(
            // ignore: prefer_const_constructors
            displayLarge: TextStyle(
                fontFamily: 'DANA',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SolidColors.posterTitle),
            titleMedium: const TextStyle(
                fontFamily: 'DANA',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: SolidColors.posterSubTitle),
            titleSmall: const TextStyle(
                fontFamily: 'DANA',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: SolidColors.posterTitle),
            // ignore: prefer_const_constructors
            bodyLarge: TextStyle(
              fontFamily: 'DANA',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,

              // ignore: prefer_const_constructors
            ),
            bodyMedium: const TextStyle(
              fontFamily: 'DANA',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w300,

              // ignore: prefer_const_constructors
            ),

            displayMedium: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            displaySmall: const TextStyle(
                fontFamily: 'DANA ',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: SolidColors.seeMore),
            headlineMedium: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 14,
              color: Color.fromARGB(255, 86, 85, 85),
              fontWeight: FontWeight.bold,
            ),
            labelLarge: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            labelSmall: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            labelMedium: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 16,
              color: Color.fromARGB(255, 56, 56, 56),
              fontWeight: FontWeight.bold,
            ),

            bodySmall: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 16,
              color: SolidColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        //home: MyCats(),
        home: SplashScreen()
        //SplashScreen(),
        );
  }
}

class NamdeRout {
  static String routMainScreen = '/MainScreen';
  static String routSingleScreen = '/SingleScreen';
  static String manageArticle = '/ManageArticle';
  static String singleManageScreen = '/SingleManageScreen';
}
