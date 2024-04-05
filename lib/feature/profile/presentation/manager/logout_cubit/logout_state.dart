

abstract class LogoutStates {}

class LogoutInitial extends LogoutStates {}
class LogoutWaitingState extends LogoutStates {}
class LogoutSuccessState extends LogoutStates {



}
class LogoutErrorState extends LogoutStates{
  final String mess;

  LogoutErrorState(this.mess);
}
class LogoutChangeProfileImageState extends LogoutStates {}
class LogoutChangeCameraImageState extends LogoutStates {}