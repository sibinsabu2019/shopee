import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) {
      // Validate input
      if (event.username.isEmpty || event.password.isEmpty) {
        emit(LoginFailure(message: 'Username and password cannot be empty.'));
        return;
      }

      // Password validation regex
      final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');
      if (!passwordRegex.hasMatch(event.password.trim())) {
        log("has mateched");
        emit(LoginFailure(
          message: 'Password must be at least 8 characters and include lowercase, number, and special character.',
        ));
        return;
      }

      // Dummy login logic
      if (event.username.trim() == 'admin' && event.password.trim() == 'admin@123') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(message: 'Invalid username or password.'));
      }
    });
  }
}
