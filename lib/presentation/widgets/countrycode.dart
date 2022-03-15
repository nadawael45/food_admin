import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/countryProv.dart';

class CountryCode extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
      CountryCodePicker(
      onChanged: (code) {
        Provider.of<CountryProv>(context,listen: false)
            .getCountry('${code.name}','${code}');

      },
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'EG',
      favorite: ['+20','EG'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,


           // print("on init ${code?.name} ${code?.dialCode} ${code.name}"),
    );
  }
}
