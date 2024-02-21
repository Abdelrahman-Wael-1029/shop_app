import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/profile/cubit/profile_cubit.dart';
import 'package:shop_app/shared/components/components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (context) => ProfileCubit()..getProfile(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileDataErrorState) {
                defaultShowToast(
                  message: state.error,
                  context: context,
                );
              }
            },
            builder: (context, state) {
              var cubit = ProfileCubit.get(context);
              if (cubit.profileModel != null &&
                  cubit.profileModel!.status == true &&
                  !cubit.isUpdate) {
                nameController.text = cubit.profileModel!.data!.name;
                phoneController.text = cubit.profileModel!.data!.phone;
                emailController.text = cubit.profileModel!.data!.email;
              }
              return Column(
                children: [
                  if (state is UpdateProfileDataLoadingState)
                    const LinearProgressIndicator(),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: ConditionalBuilder(
                            condition: cubit.profileModel != null,
                            builder: (context) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      cubit.profileModel!.data!.image,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultTextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: nameController,
                                    label: Text(
                                      'Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email';
                                      }
                                      if (!RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(value)) {
                                        return 'please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  defaultFormButton(
                                    context: context,
                                    text: 'Update Profile',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.updateProfile(
                                          email: emailController.text,
                                          name: nameController.text,
                                          phone: phoneController.text,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
