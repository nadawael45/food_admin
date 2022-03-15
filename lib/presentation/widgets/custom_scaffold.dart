
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import 'custom_text.dart';

class CustomScaffold extends StatelessWidget {

  var body;
  bool boolAppBar;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? text;
  var prefixFunction;
  var suffixFunction;
  var scaffKey;
  CustomScaffold({
    this.boolAppBar=false,
    this.prefixIcon, this.suffixIcon, this.text, this.prefixFunction,
    this.suffixFunction,
    this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: backgroungd,
        appBar: boolAppBar==false?PreferredSize(child: SizedBox(), preferredSize: Size(0,0)):PreferredSize(
          preferredSize: Size(100.h, 17.h,),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
            child: Container(
              color:  Colors.white,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: prefixFunction,
                      icon: Icon(
                        prefixIcon,
                        color: Colors.black,
                      )),
                  CustomText(
                    fontWeight: FontWeight.bold,
                    text: text,
                    txtSize: 13.sp,
                  ),
                  IconButton(
                      onPressed: suffixFunction,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ),

        body: body,

      ),
    );
  }
}
