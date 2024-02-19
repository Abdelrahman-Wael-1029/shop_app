import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/register/cubit/register_cubit.dart';

import '../../layout/home_layout/home_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constant.dart';
import '../../shared/network/local/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void submit(context, String token) {
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
                  create: (context) => RegisterCubit(),
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccessByError) {
                        defaultShowToast(
                          message: state.registerModel.message,
                          context: context,
                        );
                      }
                      if (state is RegisterSuccess) {
                        CacheHelper.putData(
                                key: 'token',
                                value: state.registerModel.data!.token)
                            .then((value) {
                          submit(
                            context,
                            state.registerModel.data!.token,
                          );
                        });
                      }
                    },
                    builder: (context, state) {
                      var registerCubig = RegisterCubit.get(context);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Create an account",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            label: Text(
                              'Name',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            label: Text(
                              'Phone Number',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            label: Text(
                              'Email',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              }
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
                            label: Text(
                              'Password',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            obscureText: registerCubig.isPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                registerCubig.suffixIcon,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              onPressed: () {
                                registerCubig.changePasswordVisibility();
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
                            condition: state is! RegisterLoading,
                            builder: (context) => defaultFormButton(
                              text: 'Register',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  registerCubig.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
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
                                              const LoginScreen()));
                                },
                                child: const Text('Login'),
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
