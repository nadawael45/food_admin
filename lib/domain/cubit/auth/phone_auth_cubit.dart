import 'package:adminfoodapp/domain/cubit/auth/phone_auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/dialoges/toast.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthLoading());

// السطر ده بيخليني انادي علي العمليات بتاعه البلوك بعد كده
  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  //كده كده لازم اعمل  instance  الاول
  FirebaseAuth auth = FirebaseAuth.instance;
  String? id;

//المفروض استقبل من الميثود دي رقم التليفون واحطه هنا واشوف
  phoneAuth(String phone) {
    emit(PhoneAuthLoading());
// انا هنا معملتش تسجيل الدخول انا مجرد بس بتاكد من الرقم
    auth.verifyPhoneNumber(
        phoneNumber: phone,
        // اخر فتره ممكن ابعت فيها الكود/فتره سماحيه الكود
        timeout: Duration(seconds: 60),
        //ده يعني كله تمام زالكود مظبوط
        //هحتاج بقي اسيف اليوزر ف الداتا بيز بتاعتي
        //cridential  نعتبرها بيانات اليوزر اللي هتتسجل علي الفايربيز زي ال  uid  بتاعه
        verificationCompleted: (credential) {
          auth.signInWithCredential(credential).then((value){} );
          // القيمه دي هي الي هتجيلي من الفايربيز واسيفها ف الفيرستور
          emit(OtpSuccess());
        },
        verificationFailed: (error) {
          showToast(msg: error.toString(), state:ToastedStates.ERROR );
          emit(OtpFailed(error.toString()));
          print(error.toString());

        },
        codeSent: (String phoneId, [int? token]) {
          id=phoneId;

          emit(PhoneAuthSuccess(phone));
        },
        //esend code
        codeAutoRetrievalTimeout: (error) {
          emit(OtpFailed('TimeOut'));
        });
  }

  //هعمل ميثود تانيه استقبل فيها ال  pin code
submitCode(String otpCode){
    emit(OtpLoading());
    // ده هيستقلا الكود اللي اتبعت ليوزر وال id  اللي اتكريت لما سجل

    AuthCredential authCredential =PhoneAuthProvider.credential(verificationId: id!,smsCode:otpCode );
    auth.signInWithCredential(authCredential).then((value) => {

      if(value != null)
        {
        emit(OtpSuccess()),

        }else{
        showToast(msg: 'login_wrong', state: ToastedStates.WARNING),
         emit(OtpFailed(onError.toString())),
        print(onError.toString()),


}

    }).catchError((onError){
      print(onError.toString());
      showToast(msg: 'login_wrong', state: ToastedStates.WARNING);
      emit(OtpFailed(onError.toString()));
      print(onError.toString());


    });



}
}
