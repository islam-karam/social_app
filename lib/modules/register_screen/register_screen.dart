import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/home_layout/home_layout.dart';
import 'register_cubit.dart';
import '../../shared/componantes/componantes.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is CreateSuccessState) {
            navigateAndFinish(context, HomeLayout());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('REGISTER'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "login now to communicate with friends",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormFiled(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Name!!! ';
                            }
                          },
                          label: 'Name',
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultFormFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Email Address!!! ';
                            }
                          },
                          label: 'Email Address',
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormFiled(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffixIcon: RegisterCubit.get(context).suffix,
                          onSubmit: (value) {},
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .ChangePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Password Is To Short!!';
                            }
                          },
                          label: 'Email Password',
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultFormFiled(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Phone Number!!! ';
                            }
                          },
                          label: 'Phone',
                          prefixIcon: Icons.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Register',
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}