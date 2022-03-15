import 'package:adminfoodapp/presentation/modules/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/cubit/auth/email_auth_cubit.dart';
import '../../domain/cubit/auth/email_auth_state.dart';
import '../../shared/constants/colors.dart';
import '../dialoges/toast.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_iconbutton.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textformfield.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  IconData passIcon=Icons.visibility_off;
  bool value = false;
  bool obscure=true;

  TextEditingController controllerPass=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();

   GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Padding(
        padding:  EdgeInsets.only(right:28.sp,left: 28.sp,top: 10.sp,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(

                        'assets/images/trasparentlogo.png',
                        height: h * 0.3,
                        width: w * 0.5,
                      ),

                      Positioned(
                        top: h*0.25,
                        child: Container(
                            child: CustomText(text: 'Sign In To Continue',)),
                      ),

                    ],

                  )),

              BlocConsumer<EmailAuthCubit,EmailAuthStates>(
                listener: (BuildContext context, state) {
                  if(state is SignInSuccess){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Home()));

                    print('SigninSuccess');
                  }
                },
                builder: (BuildContext context, Object? state) =>

                    Form(
                      child:
                      Column(
                        children: [
                          Padding(padding:  EdgeInsets.only(bottom:24.sp),),
                          CustomTextFormField(text: 'Email',controller: controllerEmail,
                            hintText: 'Enter Your Email',prefixIcon:Icons.mail,obscureTxt: false,keyBoardType: TextInputType.emailAddress,),

                          Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                          CustomTextFormField(text: 'Passwod',controller: controllerPass,
                  hintText: 'Enter Your Password',prefixIcon: Icons.lock,obscureTxt: obscure,suffixIcon: obscure?Icons.visibility_off:Icons.remove_red_eye,keyBoardType: TextInputType.visiblePassword,
                  function: (){
                  setState(() {
                          obscure=!obscure;
                  }

                  );
                //  passIcon==Icons.visibility_off?Icons.remove_red_eye:Icons.visibility_off;

                  },),
                        ],
                      ),
                    ),
              ),

              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(priGrey),
                      focusColor: priGreen,
                        value: value, onChanged: (bool){setState(() {
                      value=bool!;
                    });}),
                    CustomText(text: 'Remember me',color: Colors.grey,)

                  ],),
                  InkWell(onTap: (){
                   // Navigator.of(context).pushNamed(forgotpass);
                  },
                      child: CustomText(text: 'Forgot Password?',fontWeight: FontWeight.bold,color: priGreen,))
              ],),

              Padding(padding:  EdgeInsets.only(bottom:10.sp),),
              CustomButton('Login', (){
                EmailAuthCubit.get(context).SignInAuth(controllerEmail.text, controllerPass.text);

              }),


            SizedBox(height: 20.sp,)




            ],
          ),
        ),
      ),
    );
  }
}
