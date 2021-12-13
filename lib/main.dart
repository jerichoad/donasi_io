import 'package:donasi_io/pages/addcampaign.dart';
import 'package:donasi_io/pages/detailproduct_page.dart';
import 'package:donasi_io/pages/home/main_page.dart';
import 'package:donasi_io/pages/sign_in_page.dart';
import 'package:donasi_io/pages/sign_up_page.dart';
import 'package:donasi_io/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String active_user = "";

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}


/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {  
    if (result == '')
      runApp(SignInPage());
    else {
      active_user = result;
      runApp(MyApp());
    }
  });
}*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        //'/detailproduct': (context) => DetailProductPage(key: key, idcampaign: 0,),
        '/addcampaign': (context) => AddCampaign(),
      },
    );
  }
}