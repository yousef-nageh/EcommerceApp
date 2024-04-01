import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/authentication_repo.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignupStates> {
  SignUpCubit(this.authenticationRepo) : super(SignupInitial());

  static SignUpCubit getInstance(context) => BlocProvider.of(context);
  AuthenticationRepo authenticationRepo;
  final nameText = TextEditingController();
  final passwordText = TextEditingController();
  final emailText = TextEditingController();
  final phoneText = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility;

  void setPasswordIcons() {
    hidePassword = !hidePassword;
    hidePassword
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePassWordIconState());
  }

  void signupButtonFunction() {
    if (formKey.currentState!.validate()) {
      postSignupData(
          email: emailText.text,
          phone: phoneText.text,
          password: passwordText.text,
          name: nameText.text);

    }
  }

//***********************************************************************************************************//
  Future<void> postSignupData({
    required String email,
    required String phone,
    required String password,
    required String name,
  }) async {
    emit(SignupWaitingState());
    var result = await authenticationRepo.postSignupData(
        email: email, phone: phone, password: password, name: name);
    result.fold((error) => emit(SignupErrorState(error.errorMessage)),
        (signupModel) => emit(SignupSuccessState(signupModel)));
  }
}
