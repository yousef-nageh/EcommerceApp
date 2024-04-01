import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/profile/data/models/profile_model.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  ProfileRepo profileRepo;

  static ProfileCubit getInstance(context) => BlocProvider.of(context);
  final emailText = TextEditingController();
  final phoneText = TextEditingController();
  final nameText = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ProfileModel? profileModelData;
  Future<void> getProfileData() async {
    emit(GetProfileWaitingState());
    var result = await profileRepo.getProfileData();
    result.fold((error) => emit(GetProfileErrorState(error.errorMessage)),
        (profileModel) {
      profileModelData=profileModel;
          setController(profileModel);
          emit(GetProfileSuccessState());
        });
  }
  void setController(ProfileModel? profileModel){
    emailText.text=profileModel?.data?.email??"";
   phoneText.text=profileModel?.data?.phone??"";
    nameText.text = profileModel?.data?.name ?? "";
  }
  Future<void> updateUserData()async {
    emit(UpdateProfileWaitingState());
    var result= await profileRepo.updateProfileData(name:   nameText.text, email:   emailText.text, phone:   phoneText.text);
    result.fold((error) => emit(UpdateProfileErrorState(error.errorMessage)), (model) {
      emit(UpdateProfileSuccessState(model));
      getProfileData();

    });
  }
  void validForm(BuildContext context){
    if(formKey.currentState?.validate()==true){
      context.popTo();
      updateUserData();


    }
  }
}
