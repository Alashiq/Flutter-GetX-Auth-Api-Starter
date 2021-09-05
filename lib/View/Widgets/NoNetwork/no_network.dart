import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoNetwork extends StatelessWidget {
  final Function? onInit;
  const NoNetwork({Key? key, @required this.onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/no-internet.png',
            height: 180,
            width: 180,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "إنقطع الإتصال",
            style: GoogleFonts.tajawal(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xffffca54)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "نعتذر لا يتوفر اي اتصال بالإنترنت , قم بالتأكد من اتصالك بالإنترنت وحاول مجددا",
              style: GoogleFonts.cairo(
                color: Color(0xff777777),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 52,
            width: 160,
            child: ElevatedButton(
              onPressed: () async {
                if (onInit != null) {
                  await onInit!();
                }
              },
              child: Text(
                "إعادة تحميل",
                style: GoogleFonts.cairo(
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffffca54),
              ),
            ),
          )
        ],
      ),
    );
  }
}
