import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

showInternetMessage(String message) {
  BotToast.showCustomText(
    align: Alignment.center,
    toastBuilder: (close) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.black.withOpacity(0.45),
          alignment: Alignment.center,
          child: Container(
            width: 300,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Orange Bar
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFCCA3D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  child: Image.asset('assets/img/internet.png'),
                ),
                // Title
                Container(
                  height: 56,
                  alignment: Alignment.center,
                  child: Text(
                    "فشل",
                    style: TextStyle(
                      fontFamily: 'Droid',
                      fontSize: 24,
                      color: Color(0xFF52575f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Message
                Container(
                  margin: EdgeInsets.fromLTRB(10, 8, 10, 10),
                  width: double.infinity,
                  child: Text(
                    message,
                    style: TextStyle(
                      fontFamily: 'Droid',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Close Button
                Container(
                  height: 44,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: OutlineButton(
                    onPressed: close,
                    child: Text(
                      "حسنا",
                      style: TextStyle(
                          fontFamily: 'Droid',
                          color: Color(0xffFCCA3D),
                          fontSize: 16),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffFCCA3D),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    duration: null,
    onClose: () {
      print("closed");
    },
    onlyOne: false,
  );
}
