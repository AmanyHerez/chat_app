import 'package:chat_app/data/chatHelper.dart';
import 'package:chat_app/views/screen/users_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../data/authHelper.dart';
import '../router/router.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> signUpKey = GlobalKey();

  //GlobalKey<FormState> Keylogin = GlobalKey();
  //GlobalKey<FormState> registerKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController cityController = TextEditingController();

  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  }

  emailValidation(String value) {
    if (!isEmail(value)) {
      return "صيغة الايميل خاطئة";
    }
  }

  passwordValidation(String value) {
    if (value.length < 6) {
      return ' يجب ان تكون كلمة السر 6 حروف على الاقل';
    }
  }
  phoneValidation(String value) {
    if (value.length < 9) {
      return '   يجب ان تكون رقم الجوال يساوي 10';
    }
  }
  checkUser(){
    AuthHelper.authHelper.checkUser();
  }

  SignIn() async {
    if (loginKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signIn(emailController.text, passwordController.text);
      if (credential != null) {
        AppRouter.NavigateWithReplacemtnToWidget(UsersScreen());
      }

    }
  }
  SignUp() async {
    if (signUpKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signUp(emailController.text, passwordController.text);
      if (credential != null) {
        ChatHelper.chatHelper.saveUser(emailController.text,credential.user!.uid );
        AppRouter.NavigateWithReplacemtnToWidget(UsersScreen());
      }

    }
  }
  forgetPassword(){
//AuthHelper.authHelper.forgetPassword('AmanyHerez2000@gmail.com');
    AuthHelper.authHelper.forgetPassword(emailController.text.trim());
  }
  SignOut(){
    AuthHelper.authHelper.signOut();
  }
  Register()async{
    AuthHelper.authHelper.signUp(emailController.text, passwordController.text);
  }
  login()async{
    AuthHelper.authHelper.signIn(emailController.text, passwordController.text);
  }

}