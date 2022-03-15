import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import 'countrycode.dart';
import 'custom_text.dart';
class CustomTextFormField extends StatefulWidget {
  var prefixIcon;
  var suffixIcon;
  String? hintText;
  bool? obscureTxt;
  bool readonly;
  bool autoFocus;
  var keyBoardType;
  var onSaved;
  var controller;
  var validate;
  var function;
  var onTap;
  bool countrycode;
  String? text;
var rowWidget;
  CustomTextFormField({this.prefixIcon, this.suffixIcon, this.hintText,this.controller,this.onTap,this.text,this.rowWidget,
      this.obscureTxt=false, this.onSaved, this.validate,this.function,this.keyBoardType,this.countrycode=false,
    this.readonly=false,
    this.autoFocus=false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(text: widget.text,),
            Spacer(),
            widget.rowWidget==null?SizedBox():widget.rowWidget,
          ],
        ),
        Padding(padding:  EdgeInsets.only(bottom:8.sp),),
        Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            obscureText: widget.obscureTxt!,

            //validator: widget.validate,
            onTap: widget.countrycode?widget.onTap:(){},
            onSaved:widget.onSaved ,
            controller: widget.controller,
//    focusNode: FocusScope.of(context).unfocus();,
            autofocus:widget.autoFocus ,
            readOnly:  widget.readonly,
            keyboardType: widget.keyBoardType,
            decoration: InputDecoration(

             // labelText: widget.countrycode?widget.countryName!:'',

              border: OutlineInputBorder(

                borderSide: BorderSide(color: Colors.grey, width: 3.0,),
                borderRadius: BorderRadius.circular(10),


              ) ,
              prefixIcon:widget.countrycode? CountryCode(): Icon(widget.prefixIcon,),
             suffixIcon: InkWell(onTap: widget.function,
                 child: Icon(widget.suffixIcon,color: Colors.grey.shade400,)),
              hintText: widget.hintText!,
              hintStyle: GoogleFonts.tajawal(
                color: priGrey,
                fontSize: 11.sp,





              )),



          ),
        ),
      ],
    );
  }
}
