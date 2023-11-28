import 'package:final_tech_7/component/myString.dart';
import 'package:final_tech_7/gen/assets.gen.dart';
import 'package:final_tech_7/view/my_categorys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatefulWidget {
  const RegisterIntro({super.key});

  @override
  State<RegisterIntro> createState() => _RegisterIntroState();
}

class _RegisterIntroState extends State<RegisterIntro> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.tcbot,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom, style: textTheme.bodyMedium)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text(
                  'بزن بریم ',
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: textTheme.labelMedium,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "tchblog@gmail.com",
                        helperStyle: textTheme.headlineSmall),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activaitCodeBottomSheet(context, size, textTheme);
                    },
                    child: Text('ادامه '))
              ],
            ),
          ),
        );
      },
    );
  }

  void _activaitCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.labelMedium,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "********",
                        helperStyle: textTheme.headlineSmall),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyCats(),
                      ));
                    },
                    child: Text('ادامه '))
              ],
            ),
          ),
        );
      },
    );
  }
}
