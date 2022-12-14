import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monarch_mart/model/login_user_input.dart';
import 'package:monarch_mart/model/signup_user_input.dart';
import 'package:monarch_mart/model/authmodel.dart';
import 'package:monarch_mart/repositories/products_repositories.dart';
import 'package:monarch_mart/utils/db.dart';
import 'package:monarch_mart/view/android_view/android_main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier() : super(AuthModel());

  userSignup(SignupUserInput signupUserInput, context) async {
    AuthModel response =
        await ProductRepositories().signupData(signupUserInput);
    if (response.success == true) {
      state = response;
      final SharedPreferences db = await prefs;
      db.setString("uid", response.data!.userid.toString());
      db.setString("name", response.data!.fullname.toString());
      db.setString("email", response.data!.email.toString());
      if (state.success == true) {
        Fluttertoast.showToast(msg: "sign-up successfully");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AndroidMainPage()),
            (route) => false);
      } else {
        Fluttertoast.showToast(msg: "User already exits");
      }
    }
  }

  userSignin(LoginUserInput loginUserInput, context) async {
    // var loginUserInput =
    //     LoginUserInput(email: "sabitur@gmail.com", password: '123345678');
    AuthModel response = await ProductRepositories().signinData(loginUserInput);
    if (response.success == true) {
      state = response;
      final SharedPreferences db = await prefs;
      db.setString("uid", response.data!.userid.toString());
      db.setString("name", response.data!.fullname.toString());
      db.setString("email", response.data!.email.toString());
      print("data is here i am seeing:${state.success}");
      if (state.success == true) {
        Fluttertoast.showToast(msg: "Login successfully");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AndroidMainPage()),
            (route) => false);
      } else {
        Fluttertoast.showToast(msg: "User not found");
      }
    }
  }
}
