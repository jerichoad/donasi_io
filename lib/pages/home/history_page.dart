import 'package:donasi_io/theme.dart';
import 'package:donasi_io/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'History',
          style: primaryTextStyle.copyWith(
            fontWeight: bold
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyHistory(){
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.activity,
                color: primaryColor,
                size: 68,
              ),
              SizedBox(height: 24,),
              Text(
                'You don\'t have any donation',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold
                ),
              ),
              SizedBox(height: 12,),
              Text(
                'Let\'s find any donation',
                style: secondaryTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget content(){
      return Expanded(
        child: Container(
          color: backgroundColor1,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin
            ),
            children: [
              HistoryCard(),
            ],
          ),
        ),
      );
    }


    return Column(
      children: [
        header(),
        //emptyHistory(),
        content(),
      ],
    );
  }
}