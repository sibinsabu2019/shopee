// presentation/blocs/login/login_state.dart
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String? message;
 LoginFailure({this.message}); 
}
