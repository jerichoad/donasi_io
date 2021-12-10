import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detailproduct');
      },
      child: Container(
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
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              'https://asset.kompas.com/crops/Nq9eLCFN2N7Myk34B-bNABmWsPA=/0x0:0x0/750x500/data/photo/2021/12/07/61aec5d337a68.jpg',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
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
                  height: 12,
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
                  style: blueTextStyle.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
          
        ],),
      ),
    );
  }
}