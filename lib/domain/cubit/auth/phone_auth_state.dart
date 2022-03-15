class PhoneAuthStates{
}
class PhoneAuthLoading extends PhoneAuthStates{}
// في حاله النجاح لازم اعرف رقم التليفون لان معني ان هو نجح ان االرساله اتبعتت بتاعه الرقم السري
class PhoneAuthSuccess extends PhoneAuthStates{
  String? phoneNo;

  PhoneAuthSuccess(this.phoneNo);

}
class PhoneAuthFailed extends PhoneAuthStates{
  String? error;

  PhoneAuthFailed(this.error);
}

class OtpLoading extends PhoneAuthStates{}
class OtpSuccess extends PhoneAuthStates{}
class OtpFailed extends PhoneAuthStates{
  String? error;

  OtpFailed(this.error);

}

