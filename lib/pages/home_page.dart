import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/svg.dart';

import 'package:uber_eats/json/home_page_json.dart';
import 'package:uber_eats/theme/color.dart';
import 'package:uber_eats/theme/styles.dart';
import 'package:uber_eats/widget/custom_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(menu.length, (index)
                {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMenu = index;
                        });
                      },
                      child: activeMenu == index ? Jello(
                        child: Container(
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(padding: const EdgeInsets.only(
                            left: 15, 
                            right: 15, 
                            bottom: 8, 
                            top: 8
                            ),
                            child: Row(
                              children: [
                                Text(menu[index], style: const TextStyle (
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      )
                      :Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(padding: const EdgeInsets.only(
                            left: 15, 
                            right: 15, 
                            bottom: 8, 
                            top: 8
                            ),
                            child: Row(
                              children: [
                                Text(menu[index], style: const TextStyle (
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: black,
                                ),)
                              ],
                            ),
                          ),
                        ),
                    ),
                  );
                })
              ),
              const SizedBox(
                height: 15
              ),
               Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    height: 45,
                    width: size.width - 70,
                    decoration: BoxDecoration(
                      color: textFieldColor, 
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/pin_icon.svg",
                            width: 20,
                            ),
                            const SizedBox(width: 5),
                            Text("New York", 
                            style: customContetnt,
                            )
                          ],
                          ),
                        ),
                        Padding(padding:const EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(padding:const EdgeInsets.only(
                            left: 15, 
                            right: 15
                            ),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/time_icon.svg",
                              width: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text("Now", style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                    child: SvgPicture. asset("assets/icons/filter_icon.svg"),
                  ),
                 )
                ],
              ),
              const SizedBox(height: 15),
              const CustomSliderWidget(
                items: [
                  "assets/images/slide_1.jpg",
                  "assets/images/slide_2.jpg",
                  "assets/images/slide_3.jpg"
                ]
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: textFieldColor),
                  child: Padding(padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    decoration: const BoxDecoration(color: white),
                    child: Padding(padding: const EdgeInsets.only(
                      top: 15, 
                      bottom: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: List.generate(categories.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(categories[index]['img'],
                                    width: 40,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(categories[index]['name'],
                                    style: customContetnt,
                                    )
                                  ],
                                ),
                              );
                            })
                          ),
                        ),
                      ),
                      ),
                  ),
                )
            ),
            SizedBox(height: 15,),
            Container(
              width: size.width,
              child: Padding(padding: EdgeInsets.only(left:15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: 160,
                        child: Image(image: NetworkImage(firstMenu[0]['img']),fit: BoxFit.cover,),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 15,
                        child: SvgPicture.asset(firstMenu[0]['is_liked'] ? 
                        "assets/icons/loved_icon.svg" : "assets/icons/love_icon.svg",
                        width: 20,
                        color: white,),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(firstMenu[0]['name'], 
                  style: const TextStyle(fontSize: 16, 
                  fontWeight:FontWeight.w400
                  ),),
                  
                ],
              ),),
            )
          ],
        )
      ],
    );
  }
}