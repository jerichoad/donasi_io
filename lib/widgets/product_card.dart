import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 300,
      margin: EdgeInsets.only(
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor2,
      ),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.network(
          'https://cdn0-production-images-kly.akamaized.net/XEkdRQ9wW5vahXgtFzzfvBNGNic=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3654077/original/073565300_1638777502-KESIAPAN_SEMERU.jpg',
          width: 215,
          height: 150,
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Bencana',
                style: secondaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'DONASI BENCANA SEMERU',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 15,
              ),
              LinearPercentIndicator(
                width: 175,
                lineHeight: 10.0,
                percent: 1 - (0.2),
                backgroundColor: secondaryTextColor,
                progressColor: primaryColor,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Rp. 1.000.000',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
        )
        
      ],),
    );
  }
}