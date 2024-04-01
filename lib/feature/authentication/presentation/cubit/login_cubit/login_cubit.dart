import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/feature/authentication/data/repositories/authentication_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authenticationRepo) : super(LoginInitial());

  static LoginCubit getInstance(context) => BlocProvider.of(context);
  AuthenticationRepo authenticationRepo;
  final emailTest=TextEditingController();
  final passwordTest=TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkBox = false;
  bool hidePassword = true;
  IconData passwordIcon = Icons.visibility;

  void setCheckBox(bool value) {
    checkBox = value;
    emit(ChangeCheckBoxState());
  }

  void setPasswordIcons() {
    hidePassword = !hidePassword;
    hidePassword
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePassWordIconState());
  }
  void loginButtonFunction(){

      if (formKey.currentState!.validate()) {
        postLoginData(
            email: emailTest.text,
            password:passwordTest.text);

      }

  }

  //************************************************//
  Future<void> postLoginData({
    required String email,
    required String password,
  }) async {
    emit(LoginWaitingState());
    var result = await authenticationRepo.postLoginData(
        email: email, password: password);
    result.fold((error) => emit(LoginErrorState(error.errorMessage)),
        (signupModel) => emit(LoginSuccessState(signupModel)));
  }
}
