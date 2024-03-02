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
              height: 15,
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
                            SvgPicture.asset("assets/images/pin_icon.svg",
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
                              SvgPicture.asset("assets/images/time_icon.svg",
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
                    child: SvgPicture. asset("assets/images/filter_icon.svg"),
                  ),
                 )
                ],
              ),
              const SizedBox(height: 15),
              const CustomSliderWidget(
                items: [
                  //"assets/images/slid_1.jpg"
                ]
              )

          ],
        )
      ],
    );
  }
}