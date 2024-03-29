import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/svg.dart';

import 'package:uber_eats/json/home_page_json.dart';
import 'package:uber_eats/pages/store_detail_page.dart';
import 'package:uber_eats/theme/color.dart';
import 'package:uber_eats/theme/styles.dart';
import 'package:uber_eats/widget/custom_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                children: List.generate(menu.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMenu = index;
                        });
                      },
                      child: activeMenu == index
                          ? HeadShake(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 8, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        menu[index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 8, top: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      menu[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                })),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/pin_icon.svg",
                              width: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "New York",
                              style: customContetnt,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/time_icon.svg",
                                  width: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Now",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                Expanded(
                  child: Container(
                    child: SvgPicture.asset("assets/icons/filter_icon.svg"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            const CustomSliderWidget(items: [
              "assets/images/slide_1.jpg",
              "assets/images/slide_2.jpg",
              "assets/images/slide_3.jpg"
            ]),
            Container(
                width: size.width,
                decoration: BoxDecoration(color: textFieldColor),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    decoration: const BoxDecoration(color: white),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Row(
                              children:
                                  List.generate(categories.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    categories[index]['img'],
                                    width: 40,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    categories[index]['name'],
                                    style: customContetnt,
                                  )
                                ],
                              ),
                            );
                          })),
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: size.width,
              child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetailPage(
                            img: firstMenu[0]['img'],
                          ))
                          );
                        },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: 160,
                            child: Image(
                              image: NetworkImage(firstMenu[0]['img']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: SvgPicture.asset(
                              firstMenu[0]['is_liked']
                                  ? "assets/icons/loved_icon.svg"
                                  : "assets/icons/love_icon.svg",
                              width: 20,
                              color: white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        firstMenu[0]['name'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Text(
                            "Sponsored",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.info, size: 15, color: Colors.grey)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        firstMenu[0]['description'],
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.hourglass_bottom,
                                color: primary,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                firstMenu[0]['time'],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                                color: textFieldColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                firstMenu[0]['delivery_fee'],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: size.width,
              height: 10,
              decoration: BoxDecoration(color: textFieldColor),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "More to explore",
                    style: customTitle,
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(exploreMenu.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetailPage(
                            img: exploreMenu[index]['img'],
                          ))
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 160,
                                    child: Image(
                                      image:
                                          NetworkImage(exploreMenu[index]['img']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 15,
                                    child: SvgPicture.asset(
                                      exploreMenu[index]['is_liked']
                                          ? "assets/icons/loved_icon.svg"
                                          : "assets/icons/love_icon.svg",
                                      width: 20,
                                      color: white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                exploreMenu[index]['name'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Text(
                                    "Sponsored",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.info, size: 15, color: Colors.grey)
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                exploreMenu[index]['description'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.hourglass_bottom,
                                        color: primary,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        exploreMenu[index]['time'],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        children: [
                                          Text(
                                            exploreMenu[index]['rate'],
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                          const SizedBox(width: 3),
                                          const Icon(Icons.star,
                                              color: yellowStar, size: 17),
                                          const SizedBox(width: 3),
                                          Text(
                                            exploreMenu[0]['rate_number'],
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: size.width,
              height: 10,
              decoration: BoxDecoration(color: textFieldColor),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Near You",
                    style: customTitle,
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(popluarNearYou.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StoreDetailPage(
                            img: popluarNearYou[index]['img'],
                          ))
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 160,
                                    child: Image(
                                      image:
                                          NetworkImage(popluarNearYou[index]['img']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 15,
                                    child: SvgPicture.asset(
                                      popluarNearYou[index]['is_liked']
                                          ? "assets/icons/loved_icon.svg"
                                          : "assets/icons/love_icon.svg",
                                      width: 20,
                                      color: white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                popluarNearYou[index]['name'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Text(
                                    "Sponsored",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.info, size: 15, color: Colors.grey)
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                popluarNearYou[index]['description'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(
                                        Icons.hourglass_bottom,
                                        color: primary,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        popluarNearYou[index]['time'],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        children: [
                                          Text(
                                            popluarNearYou[index]['rate'],
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                          const SizedBox(width: 3),
                                          const Icon(Icons.star,
                                              color: yellowStar, size: 17),
                                          const SizedBox(width: 3),
                                          Text(
                                            popluarNearYou[0]['rate_number'],
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
