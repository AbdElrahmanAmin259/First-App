import 'package:flutter/material.dart';

class MultiImage extends StatefulWidget {
  const MultiImage({super.key});

  @override
  State<MultiImage> createState() => _MultiImageState();
}

class _MultiImageState extends State<MultiImage> {
  List<String> photo = [
    "assets/labtop/xx.jpg",
    "assets/labtop/bb.jpg",
    "assets/labtop/xx.jpg",
    "assets/labtop/download (1).jpg",
    "assets/labtop/uu.jpg",
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Image.asset(photo[selectedindex], fit: BoxFit.cover),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(photo.length, (index) {
                return InkWell(
                  onTap: () => setState(() {
                    selectedindex = index;
                  }),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedindex == index
                              ? Colors.blue
                              : const Color.fromARGB(255, 205, 205, 205),
                        ),
                      ),
                      width: 100,
                      height: 100,
                      child: Image.asset(photo[index], fit: BoxFit.cover),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
