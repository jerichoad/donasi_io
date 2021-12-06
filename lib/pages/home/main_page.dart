import 'package:donasi_io/pages/home/history_page.dart';
import 'package:donasi_io/pages/home/home_page.dart';
import 'package:donasi_io/pages/home/profile_page.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int currIndex = 1;
  @override
  Widget build(BuildContext context) {

    Widget body(){
      if(currIndex == 1){
        return HomePage();
      }else if( currIndex == 0){
        return HistoryPage();
      }else if(currIndex == 2){
        return ProfilePage();
      }else{
        return HistoryPage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: CurvedNavigationBar(
          //key: _bottomNavigationKey,
          index: currIndex,
          height: 70.0,
          items: <Widget>[
            Icon(Iconsax.activity, size: 30),
            Icon(Iconsax.home, size: 30),
            Icon(Iconsax.personalcard,size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: primaryColor,
          backgroundColor: backgroundColor1,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (value) {
            print(value);
            setState(() {
              currIndex = value;
            });
          },
          letIndexChange: (index) => true,
        ),
    body: body(),
    );
  }
}