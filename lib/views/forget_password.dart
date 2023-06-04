
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../provider/auth_provider.dart';
import 'custome_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, AuthProvider provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      child: Image.asset(
                        "asset/image/logo.png",
                        width: 220,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Recavary password',
                    style: TextStyle(
                        color: KblackColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'please enter your email address below to recover password',

                    style: TextStyle(
                      fontFamily: 'Courgette-Regular',
                      color: KBoldgreeyColor,
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
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        provider.forgetPassword();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: KorangeColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Recover password',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Courgette-Regular',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}