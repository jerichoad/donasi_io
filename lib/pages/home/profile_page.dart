import 'dart:convert';

import 'package:donasi_io/class/account.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {

  Account? ac;
  TextEditingController txtnama = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();

  Future<String> fetchData() async {
    final response = await http.get(
      Uri.parse("http://ubaya.fun/flutter/160418108/readprofile.php"),);
    if (response.statusCode == 200) {
    return response.body;
    } else {
    throw Exception('Failed to read API');
    }
  }

  


  @override
  Widget build(BuildContext context) {

    bacaData() {
    fetchData().then((value) {
      Map json = jsonDecode(value);
      ac = Account.fromJson(json['data']);
      /*setState(() {
        txtnama.text = ac!.nama;
        txtemail.text = ac!.email;
      });*/
    });
  }

  void submit() async {
    final response = await http.post(
        Uri.parse("http://ubaya.fun/flutter/160418108/updateprofile.php"),
        body: {
          'nama': ac!.nama,
          'email': ac!.email,
        });
    if (response.statusCode == 200) {
      print(response.body);
      Map json = jsonDecode(response.body);
      if (json['result'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sukses Menambah Data')));
      }
    } else {
      throw Exception('Failed to read API');
    }
  }


    Widget header(){
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontWeight: bold
          ),
        ),
        actions: [
          IconButton(
          icon: Icon(
            Iconsax.logout,
            color: alertColor,
          ),
          onPressed: (){

          },
        ),
        ]
      );
    }

    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Name Here',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Email Here',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget footer(){
      //NOTE: BUTTONS
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 54,
                child: TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: primaryColor
                  ),
                  child: Text(
                    "Update Profile",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content(){
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pravatar.cc/100?img=4'
                  )
                )
              ),
            ),
            nameInput(),
            emailInput(),
            footer(),
          ],
        ),
      );
    }

    

    


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: header(),
      ),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}