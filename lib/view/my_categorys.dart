import 'package:final_tech_7/component/myColor.dart';
import 'package:final_tech_7/component/myString.dart';
import 'package:final_tech_7/component/my_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                Assets.images.tcbot,
                height: 100,
              ),
              Text(
                MyStrings.successfulRegistration,
                style: textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headlineMedium,
                  ),
                ),
              ),
              Text(
                MyStrings.chooseCats,
                style: textTheme.bodyMedium,
              ),
              ///////////grideLis
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(

                        ///scrrol sanjagh
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tagListName.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  if (!selectedcats
                                      .contains(tagListName[index])) {
                                    selectedcats.add(tagListName[index]);
                                  } else {
                                    print("is exited");
                                  }
                                });
                              },
                              child:
                                  MainTags(textTheme: textTheme, index: index));
                        })),
              ),
              Assets.images.errow.image(scale: 11),

              ///listcat
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(

                        ///scrrol sanjagh
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedcats.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.3),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                color: SolidColors.surface),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedcats[index].title,
                                    style: textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedcats.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
