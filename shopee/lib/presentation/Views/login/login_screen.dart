import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopee/presentation/Views/widgets/Custom_Snachbar.dart';
import 'package:shopee/presentation/Views/widgets/custom_login_button.dart';
import 'package:shopee/presentation/Views/widgets/custom_text_field.dart';
import '../../blocs/login/login_bloc.dart';
import '../../blocs/login/login_event.dart';
import '../../blocs/login/login_state.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50), // Green background
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 25, 50),
                    child: Form(
                      key: formKey,
                      child: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            AppSnackbar.showSuccess(context, "Login Success!");
                            Navigator.pushReplacementNamed(context, '/home');
                          } else if (state is LoginFailure) {
                            AppSnackbar.showError(context, state.message ?? 'Login Failed');
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                             Image.asset("assets/icon.png",
                             height: 100,
                             ),
                              const SizedBox(height: 30),
                              const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E7D32), // Dark green
                                ),
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                controller: usernameController,
                                label: 'Username',
                                icon: Icons.email,
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: passwordController,
                                label: 'Password',
                                icon: Icons.lock,
                                isPassword: true,
                              ),
                              const SizedBox(height: 40),
                              CustomLoginButton(
                                text: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(
                                      LoginSubmitted(
                                        username: usernameController.text.trim(),
                                        password: passwordController.text.trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
