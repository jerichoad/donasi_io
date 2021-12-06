import 'dart:async';

import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3), 
      () => Navigator.pushNamed(context, '/sign-in')
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(child: 
      Container(
        width: 145,
        height: 144,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/DonasiKu.png'),
          ),
        ),
      ),
      )
    );
  }
}