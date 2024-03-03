import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uber_eats/theme/color.dart';

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
        padding: const EdgeInsets.only(bottom: 60),
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
                        onPressed: () {
                  
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Starbucks (Park Row at Beekman St)", style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
