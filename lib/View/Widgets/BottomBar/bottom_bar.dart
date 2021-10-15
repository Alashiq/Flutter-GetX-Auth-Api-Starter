import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  final int? active;
  const BottomMenu({Key? key, @required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(26.0),
          topLeft: Radius.circular(26.0),
        ),
      
            boxShadow: [
        BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(0, 3),
          blurRadius: 6,
        ),
            ]
        
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.offAndToNamed("/home");
            },
            icon: Icon(
              Icons.home_outlined,
              color: active == 1 || active == null
                  ? Color(0xfff56e4c)
                  : Color(0xffdedede),
              size: 34,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_important_outlined,
              color: active == 2 ? Color(0xfff56e4c) : Color(0xffdedede),
              size: 34,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: active == 3 ? Color(0xfff56e4c) : Color(0xffdedede),
              size: 34,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: active == 4 ? Color(0xfff56e4c) : Color(0xffdedede),
              size: 34,
            ),
          ),
          IconButton(
            onPressed: () {
              print("profile screen");
              Get.offAndToNamed("/profile");
            },
            icon: Icon(
              Icons.person_outline,
              color: active == 5 ? Color(0xfff56e4c) : Color(0xffc2c2c2),
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}
