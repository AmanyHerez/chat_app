

import 'package:chat_app/views/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../constant.dart';
import '../provider/auth_provider.dart';
import '../router/router.dart';
import 'custome_textfield.dart';
import 'forget_password.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.loginKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        child: Image.asset(
                          "asset/image/logo.png",
                          width: 100,height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Welcome to chat app',
                      style: TextStyle(
                          color: KblackColor,
                          fontSize: 30,
                          fontFamily: 'Courgette-Regular',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'please enter your email address below to start \n using app',
                      style: TextStyle(
                        color: KBoldgreeyColor,
                        fontFamily: 'Courgette-Regular',
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextfield(
                      title: 'email address',
                      validator: provider.emailValidation,
                      controller: provider.emailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      title: 'password',
                      validator: provider.passwordValidation,
                      controller: provider.passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              AppRouter.NavigateWithReplacemtnToWidget(
                                  ForgetPasswordScreen());
                            },
                            child: Text(
                              'forget Password?',
                              style: TextStyle(
                                color: KorangeColor,
                                fontFamily: 'Courgette-Regular',
                              ),
                            )),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.SignIn();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: KorangeColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Courgette-Regular',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member? ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Courgette-Regular',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppRouter.NavigateWithReplacemtnToWidget(
                                SignUpScreen());
                          },
                          child: Text(
                            'join now',
                            style: TextStyle(
                              fontFamily: 'Courgette-Regular',
                              color: KorangeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //      //AuthHelper.authHelper.signUp('AmanyHerez2000@gmail.com', '123456');
                    //       provider.SignIn();
                    //     },
                    //     child: Text('تسجيل الدخول'),
                    //   ),
                    // ),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //      AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
                    //     },
                    //     child: Text('تسجيل مستخدم جديد'),
                    //   ),
                    // ),
                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       //provider.forgetPassword();
                    //       AppRouter.NavigateWithReplacemtnToWidget(ForgetPasswordScreen());
                    //     },
                    //     child: Text('نسيت كلمة المرور'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}