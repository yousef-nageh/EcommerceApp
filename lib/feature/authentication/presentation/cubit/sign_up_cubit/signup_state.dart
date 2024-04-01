import 'package:shop_app/feature/authentication/data/models/signup_model.dart';

abstract class SignupStates {}

class SignupInitial extends SignupStates {}

class ChangePassWordIconState extends SignupStates {}

class SignupWaitingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  final SignupModel model;

  SignupSuccessState(this.model);
}

class SignupErrorState extends SignupStates {
  final String error;

  SignupErrorState(this.error);
}
