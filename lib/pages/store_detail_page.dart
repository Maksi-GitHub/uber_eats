import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uber_eats/json/home_page_json.dart';
import 'package:uber_eats/theme/color.dart';
import 'package:uber_eats/theme/styles.dart';

class StoreDetailPage extends StatefulWidget {
  const StoreDetailPage({super.key, required this.img});
  final String img;

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: black.withOpacity(0.1)))),
      child: const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              "\$15.00 away from a \$0.00 delivery fee",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: primary),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 165,
                  child: Image(
                    image: NetworkImage(widget.img),
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(Icons.arrow_back, size: 25),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(Icons.favorite_border, size: 25),
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Starbucks (Park Row at Beekman St)",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                          width: size.width - 30,
                          child: const Text(
                            "Cafe - Coffee & Tea - Breakfast and Brunch - Barery \$",
                            style: TextStyle(fontSize: 14, height: 1.3),
                          ))
                    ],
                  ),
                  const SizedBox(height: 15),
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
                            exploreMenu[0]['time'],
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
                                exploreMenu[0]['rate'],
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
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    color: black.withOpacity(0.3),
                  ),
                  const SizedBox(height: 10),
                  Text("Store Info", style: customContetnt),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: (size.width) * 0.8,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/pin_icon.svg",
                                width: 15, color: black.withOpacity(0.5)),
                            const SizedBox(width: 8),
                            const Text("38 Park Row Frnt 4, New York, NY 1003",
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const Expanded(
                          child: Text(
                        "More Info",
                        style: TextStyle(
                            fontSize: 14,
                            color: primary,
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        LineIcons.comment,
                        size: 15,
                        color: primary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "People say...",
                        style: TextStyle(
                            fontSize: 14, color: black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(peopleFeedback.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                peopleFeedback[index],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: primary,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: size.width - 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: black.withOpacity(0.1),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery fee",
                            style: TextStyle(
                              color: black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (size.width - 70) * 0.8,
                                child: const Text(
                                  "There aren't enough couriers nearby, so the delivery fee is higher right now.",
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                ),
                              ),
                              Container(
                                width: (size.width - 70) * 0.2,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: black.withOpacity(0.15),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.arrow_circle_up_outlined,
                                        color: black.withOpacity(0.4),
                                        size: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: black.withOpacity(0.3),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Menu",
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(LineIcons.search, size: 25),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Packed For You",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(packForYou.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              children: [
                                Container(
                                  width: (size.width - 30) * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        packForYou[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            height: 1.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(packForYou[index]['description'],
                                          style: const TextStyle(height: 1.3)),
                                      const SizedBox(height: 10),
                                      Text(
                                        packForYou[index]['price'],
                                        style: const TextStyle(
                                            height: 1.3,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                    child: Container(
                                  height: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, bottom: 10),
                                    child: Image(
                                      image: NetworkImage(
                                          packForYou[index]['img']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
