import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uber_eats/pages/home_page.dart';
import 'package:uber_eats/theme/color.dart';

class RootAPP extends StatefulWidget {
  const RootAPP({super.key});

  @override
  State<RootAPP> createState() => _RootAPPState();
}

class _RootAPPState extends State<RootAPP> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const Center(
        child: Text(
          "Search Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: black),
        ),
      ),
      const Center(
          child: Text(
        "Grocery Page",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      )),
      const Center(
          child: Text(
        "Orders Page",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      )),
      const Center(
          child: Text(
        "Account Page",
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      ))
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      "assets/icons/home_icon.svg",
      "assets/icons/search_icon.svg",
      "assets/icons/grocery_icon.svg",
      "assets/icons/order_icon.svg",
      "assets/icons/account_icon.svg"
    ];

    List textItems = ["Home", "Search", "Grocery", "Orders", "Account"];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: white,
          border: Border(
              top: BorderSide(width: 2, color: black.withOpacity(0.06)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(textItems.length, (index) {
              return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      bottomItems[index],
                      width: 22,
                      color: pageIndex == index ? black : Colors.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(textItems[index], style: TextStyle(fontSize: 10, color: pageIndex == index ? black : black.withOpacity(0.5)),)
                  ],
                ),
              );
            })),
      ),
    );
  }
  selectedTab(index){
      setState(() {
        pageIndex = index;
      });
    }
}
