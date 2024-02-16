import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/cubit/login_cubit.dart';

import '../../layout/home_layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constant.dart';
import '../../shared/network/local/cache_helper.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    var seen = await CacheHelper.getData(key: 'token');
    if (seen != null) {
      submit(seen);
    }
  }

  void submit(String token) {
    Token = token;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeLayout()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: BlocProvider(
                  create: (context) => LoginCubit(),
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessByError) {
                        defaultShowToast(
                          message: state.loginModel.message,
                          context: context,
                        );
                      }
                      if (state is LoginSuccess) {
                        CacheHelper.putData(
                                key: 'token',
                                value: state.loginModel.data!.token)
                            .then((value) {
                          submit(state.loginModel.data!.token);
                        });
                      }
                    },
                    builder: (context, state) {
                      var loginCubit = LoginCubit.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome Back",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            label: const Text('email'),
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              }
                              // validate email format by regex
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'please enter a valid email';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            label: const Text('password'),
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            obscureText: loginCubit.isPassword,
                            suffixIcon: IconButton(
                              icon: Icon(loginCubit.suffixIcon),
                              onPressed: () {
                                loginCubit.changePasswordVisibility();
                              },
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoading,
                            builder: (context) => defaultFormButton(
                              text: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  loginCubit.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: const Text('Register'),
                              ),
                            ],
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
    );
  }
}
