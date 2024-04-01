
import 'package:shop_app/feature/authentication/data/models/signup_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}
class ChangeCheckBoxState extends LoginStates {}
class ChangePassWordIconState extends LoginStates {}
class LoginWaitingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  final SignupModel model;

  LoginSuccessState(this.model);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}
