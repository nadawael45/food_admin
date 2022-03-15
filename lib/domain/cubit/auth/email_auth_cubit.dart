import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/dialoges/toast.dart';
import 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthStates> {
  EmailAuthCubit() : super(InitialState());
  static EmailAuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  SignInAuth(String email,String password) {
    emit(SignInLoading());
     auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      if (value != null) {
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);

        emit(SignInSuccess(email));
      } else {
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        emit(SignInFailed(onError.toString()));
        print(onError.toString());
      }
    }).catchError((onError){
       print(onError.toString());
       showToast(msg: onError.toString(), state: ToastedStates.WARNING);
       emit(SignInFailed(onError.toString()));
       print(onError.toString());


       });


     }


  forgetPass(email)async{
    emit(CodePassLoading());
    await auth.sendPasswordResetEmail(email: email).then((value)  {

        emit(CodePassSuccess());
        showToast(msg: 'Check your Gmail', state: ToastedStates.SUCCESS);


    }).catchError((onError){

      emit(CodePassFailed());
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);


    });


  }

  SignUpAuth({ email, password, location,phone,name}) {
    emit(SignUpLoading());
    auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      if(value != null)
      {
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);
        emit(SignUpSuccess());
      }else{
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        emit(SignUpFailed());
        print(onError.toString());


      }

    });

  }

}
