import 'package:firebase_auth/firebase_auth.dart';
import '../router/router.dart';
import '../views/custome_dialog.dart';
import '../views/sign_in_screen.dart';
import '../views/screen/users_screen.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  checkUser()async{
    User?  user=firebaseAuthInstance.currentUser;
    if(user==null){
      AppRouter.NavigateWithReplacemtnToWidget(SignInScreen());
    }
    else{
      AppRouter.NavigateWithReplacemtnToWidget(UsersScreen());
    }
  }
String getCurrentUserId(){
    return firebaseAuthInstance.currentUser!.uid;
}

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      //اذا ماصرش ايرور رح يرجع الكريدينتل الخاص باليوزر
      final credential = await firebaseAuthInstance.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomeDialog.showDialogFunction('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomeDialog.showDialogFunction(
            'Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      final credential =
      await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomeDialog.showDialogFunction('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomeDialog.showDialogFunction(
            'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await firebaseAuthInstance.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(SignInScreen());

  }
  forgetPassword(String email)async {

    try {
      await firebaseAuthInstance.sendPasswordResetEmail(email: email);
      CustomeDialog.showDialogFunction(
          'الرجاء متابعة الايميل الخاص بك لتغير كلمة المرور');
    }on Exception catch (e) {
      print(e);
    }
  }

}