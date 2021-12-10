import 'package:flutter/material.dart';
import 'package:donasi_io/theme.dart';
import 'package:iconsax/iconsax.dart';

class AddCampaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Campaign',
          style: primaryTextStyle.copyWith(
            fontWeight: bold
          ),
        ),
      );
    }

    Widget footer(){
      //NOTE: BUTTONS
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(30),
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
                    "Create Donation",
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

    Widget targetInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donation Target',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Target',
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

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              children: [
                nameInput(),
                targetInput(),
              ],
            ),
          ),
          footer(),
        ],
      ),
    );
  }
}