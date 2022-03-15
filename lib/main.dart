import 'package:adminfoodapp/domain/cubit/product/product_cubit.dart';
import 'package:adminfoodapp/presentation/modules/home.dart';
import 'package:adminfoodapp/presentation/modules/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'domain/cubit/auth/email_auth_cubit.dart';
import 'domain/cubit/auth/phone_auth_cubit.dart';
import 'domain/provider/countryProv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider
    (

      providers: [
        ChangeNotifierProvider(create: (context) => CountryProv()),

      ],
      child: const MyApp()));


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneAuthCubit()),
        BlocProvider(create: (_) => EmailAuthCubit()),
        BlocProvider(create: (_) => ProductCubit()),

      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) =>
        MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: Home(),
        ),
      ),
    );
  }
}


