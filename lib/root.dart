import 'package:first_app/screens/multi_selection.dart';
import 'package:first_app/screens/single_selection.dart';
import 'package:first_app/screens/multi_image.dart';
import 'package:first_app/screens/toglle_selction.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final PageController controller = PageController();
  List<Widget> screens = [
    Mulitselection(),
    MultiImage(),
    ToglleSelction(),
    Multi(),
  ];
  int screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            screen = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //back
            GestureDetector(
              onTap: () {
                controller.jumpToPage(screen - 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // horizontal: 90,
                  vertical: 40,
                ),
                child: Container(
                  height: 50,
                  width: 40,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            SizedBox(width: 30),
            //Next
            GestureDetector(
              onTap: () {
                controller.jumpToPage(screen + 1);
              },

              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next Page",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
