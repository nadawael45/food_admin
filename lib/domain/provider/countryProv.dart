import 'package:flutter/material.dart';

class CountryProv extends ChangeNotifier{
  String? countryName;
  String? countryCode;

  getCountry(contName,contCode){
    countryName=contName;
    countryCode=contCode;
    notifyListeners();


  }
}