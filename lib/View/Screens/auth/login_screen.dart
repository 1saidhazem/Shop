import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/View/Screens/auth/forgot_password_screen.dart';
import 'package:shop/View/Widgets/text_utils.dart';
import '../../../Logic/Controllers/auth_controller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/my_string.dart';
import '../../../Utils/theme.dart';
import '../../Widgets/Auth/auth_button.dart';
import '../../Widgets/Auth/auth_text_from_field.dart';
import '../../Widgets/Auth/container_under.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.black,
                          prefixIcon: Image.asset('assets/images/email.png'),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password Should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              obscureText:
                                  controller.isVisibility ? false : true,
                              cursorColor: Colors.black,
                              prefixIcon: Image.asset('assets/images/lock.png'),
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot Password?',
                              fontSize: 16,
                              color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'LOG IN',
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.LogInUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_){
                              return InkWell(
                                onTap: () {
                                  controller.FacebookSignUpApp();
                                },
                                child: Image.asset('assets/images/facebook.png'),
                              );
                            }),
                            const SizedBox(
                              width: 16,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.GoogleSignUpApp();
                                },
                                child: Image.asset('assets/images/google.png'),
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an account?",
                textType: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
