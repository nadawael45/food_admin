import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  String? text;
  double?txtSize;
  FontWeight?fontWeight;
  Color? color;
  TextAlign textAlign;

  CustomText({this.text, this.txtSize, this.fontWeight,
    this.color ,
    this.textAlign=TextAlign.center});

  @override
  Widget build(BuildContext context) {

    return Text((text!),
        textAlign: textAlign,

        style:  GoogleFonts.tajawal(
          color: color,
          fontSize: txtSize,
          fontWeight: fontWeight,




        ));
  }
}
