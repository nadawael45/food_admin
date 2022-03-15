class EmailAuthStates{
}
class InitialState extends EmailAuthStates{}

class SignInLoading extends EmailAuthStates{}
// في حاله النجاح لازم اعرف رقم التليفون لان معني ان هو نجح ان االرساله اتبعتت بتاعه الرقم السري
class SignInSuccess extends EmailAuthStates{
  String? email;


  SignInSuccess(this.email);

}
class SignInFailed extends EmailAuthStates{
  String? error;

  SignInFailed(this.error);



}



class CodePassLoading extends EmailAuthStates{}
class CodePassSuccess extends EmailAuthStates{}
class CodePassFailed extends EmailAuthStates{}

class SignUpLoading extends EmailAuthStates{}
class SignUpSuccess extends EmailAuthStates{}
class SignUpFailed extends EmailAuthStates{}

