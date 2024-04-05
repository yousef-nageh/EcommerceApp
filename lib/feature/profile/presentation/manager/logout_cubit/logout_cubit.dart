import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/core/config/extension.dart';
import 'package:shop_app/feature/profile/data/repositories/profile_repo.dart';

import '../../../../../app/functions/toast_msg.dart';
import '../../../../../core/config/routes/app_routes.dart';
import '../../../../../core/util/app_color.dart';
import '../../../../../core/util/app_image.dart';
import '../../../../../core/util/app_string.dart';
import '../../../../../core/util/icon_broken.dart';
import '../../widgets/show-logout_dialog.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit(this.profileRepo) : super(LogoutInitial());
  ProfileRepo profileRepo;

  static LogoutCubit instance(BuildContext context) => BlocProvider.of(context);
  File ? image;
  File ? CameraImage;
  final imagePiker=ImagePicker();
 Future<void>  setProfileImage()async{
   var selectedImage= await imagePiker.pickImage(source: ImageSource.gallery);
   if(selectedImage !=null){
     image =File(selectedImage.path);
     emit(LogoutChangeProfileImageState());
   }
 }
  Future<void>  setCameraImage()async{
    var selectedImage= await imagePiker.pickImage(source: ImageSource.camera);
    if(selectedImage !=null){
      CameraImage =File(selectedImage.path);
      emit(LogoutChangeCameraImageState());
    }
  }
  ImageProvider getProfileImage(){
   if(image != null){
     return FileImage(image!);

   }else if(CameraImage != null){
     return FileImage(CameraImage!);
   }
   return  CachedNetworkImageProvider(AppImage.profile, );
  }
  List<IconData> profileIcon = [
    IconBroken.Profile,
    IconBroken.Notification,
    IconBroken.Setting,
    IconBroken.Info_Circle,
    IconBroken.Logout,
  ];
  List<String> profileNames = [
    AppString.myAccount,
    AppString.notification,
    AppString.setting,
    AppString.helpCenter,
    AppString.logout,
  ];

  void iconMethod(int index, BuildContext context) {
    if (index == 0) {
      context.navigateTo(pageName: AppRoutes.myAccountRoute);
    }
    else if (index == 4) {
      showLogoutDialog(
        context,
        ()  {
        if(Navigator.of(context).canPop()) {
          context.popTo();
        }
           logoutUser();



        },
      );
    }
    else{
      toastMsg(AppString.provideItLater,AppColor.green);
    }
  }

  Future<void> logoutUser() async {
    emit(LogoutWaitingState());
    var result = await profileRepo.logout();
    result.fold((error) => emit(LogoutErrorState(error.errorMessage)),
        (model) => emit(LogoutSuccessState()));
  }
}
