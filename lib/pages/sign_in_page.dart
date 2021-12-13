import 'dart:convert';

import 'package:donasi_io/pages/splash_page.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'home/main_page.dart';

late String active_user = "";

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late String _user_id;
  late String _user_password;
  late String error_login;

  Future<String> checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString("user_id") ?? '';
    return user_id;
  }

  void launch(){
    WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {  
    if (result == '')
      runApp(SignInPage());
    else {
      active_user = result;
      runApp(MainPage());
    }
  });
  }


  void doLogin() async {    
    final response = await http
      .post(Uri.parse("http://ubaya.fun/flutter/160418108/campaign/login.php"),
      body: {'user_id': _user_id, 'user_password': _user_password});

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      if (json['result'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("user_id", _user_id);
        prefs.setString("user_name", json['nama']);
        //print(_user_id);
        MainPage();
      } else {
        setState(() {
          error_login = "User id atau password error";
          print(error_login);
        });
      }
    } else {
      throw Exception('Failed to read API');
    }
  }

  

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Sign In to Continue",
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              )
            )
          ],
        )
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.email, color: primaryColor,),
                    SizedBox(
                      width:16
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Username",
                          hintStyle: secondaryTextStyle
                        ),
                        onChanged: (v){
                          _user_id = v;
                          print(_user_id);
                        },
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.lock, color: primaryColor,),
                    SizedBox(
                      width:16
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: secondaryTextStyle
                        ),
                        onChanged: (v){
                          _user_password = v;
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () async {
            //prefs.setString("user_id", _user_id);
            //doLogin();
            Navigator.pushNamed(context, '/home');

            final prefs = await SharedPreferences.getInstance();
            prefs.setString("user_id", _user_id);

            print("USER YANG TERDAFTAR ADALAH");
            print(await prefs.getString('user_id'));
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          child: Text(
            "Sign In",
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium
            )
          ),
        ),
      );
    }

    Widget footer(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account? ', style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),),
            GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text("Register Here!", 
                style: blueTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                )
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      )
      
    );
  }
}