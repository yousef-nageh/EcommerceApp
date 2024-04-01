import '../../../../home/data/models/change_card_model.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class GetProfileWaitingState extends ProfileStates {}

class GetProfileSuccessState extends ProfileStates {}
class GetProfileErrorState extends ProfileStates {
  final String mass;

  GetProfileErrorState(this.mass);
}
class UpdateProfileWaitingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final MessageAndStatusModel model;


  UpdateProfileSuccessState(this.model);}
class UpdateProfileErrorState extends ProfileStates {
  final String mass;

  UpdateProfileErrorState(this.mass);
}