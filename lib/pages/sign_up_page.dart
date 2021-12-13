import 'dart:convert';

import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String username = "";
  String nama = "";
  String email = "";
  String password = "";

  

  @override
  Widget build(BuildContext context) {

    void submit() async {
      final response = await http
          .post(Uri.parse("http://ubaya.fun/flutter/160418108/register.php"), body: {
        'username': username,
        'nama': nama,
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body);
        if (json['result'] == 'success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Sukses Menambah Data')));
        }
      } else {
        throw Exception('Failed to read API');
      }
    }

    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 50),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 2,),
            Text(
              "Sign Up to Continue",
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              )
            )
          ],
        )
      );
    }

    Widget fullnameInput(){
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
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
                    Icon(Icons.person, color: primaryColor,),
                    SizedBox(
                      width:16
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Name",
                          hintStyle: secondaryTextStyle
                        ),
                        onChanged: (value){
                          nama = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'title can not be empty';
                          }
                          return null;
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

    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
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
                    Icon(Icons.circle_rounded, color: primaryColor,),
                    SizedBox(
                      width:16
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
                          hintStyle: secondaryTextStyle
                        ),
                        onChanged: (value){
                          username = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'can not be empty';
                          }
                          return null;
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

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
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
                          hintText: "Your Email Address",
                          hintStyle: secondaryTextStyle
                        ),
                        onChanged: (value){
                          email = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'can not be empty';
                          }
                          return null;
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
                        onChanged: (value){
                          password = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'can not be empty';
                          }
                          return null;
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

    Widget signUpButton(){
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () async {
            submit();
            final prefs = await SharedPreferences.getInstance();
            prefs.setString("user_id", username);
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )
          ),
          child: Text(
            "Sign Up",
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
            Text('Already Have an Account? ', style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),),
            GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text("Sign In", 
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
              fullnameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      )
      
    );
  }
}