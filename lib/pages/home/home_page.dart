import 'package:donasi_io/theme.dart';
import 'package:donasi_io/widgets/product_card.dart';
import 'package:donasi_io/widgets/product_tile.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin, 
          left: defaultMargin, 
          right: defaultMargin
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Halo, User",
                  style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semibold,
                  ),),
                  Text("@username",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14, 
                  ),),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage('https://i.pravatar.cc/100?img=4'))
              ),
            )
          ],
        ),
      );
    }

    Widget cardHeader(){
      return Container(
        margin: EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Create Your Campaign",
                          style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semibold,
                          ),),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/addcampaign');
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,  
                          color: backgroundColor1,
                        ),
                        child: Icon(
                          Icons.navigate_next,
                          color: primaryColor,
                        ),
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

    Widget urgentDonationTitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Urgent Donation',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        )
      );
    }

    Widget urgentDonation(){
      return Container(
        margin: EdgeInsets.only(top:20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  ProductCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget listDonationTitle(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Explore',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        )
      );
    }

    Widget listDonation(){
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: ProductTile(),
      );
    }
    
    return ListView(
      children: [
        header(),
        cardHeader(),
        urgentDonationTitle(),
        urgentDonation(),
        listDonationTitle(),
        listDonation(),
      ],
    );
  }
}