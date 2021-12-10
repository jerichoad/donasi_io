import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detailproduct');
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://asset.kompas.com/crops/Nq9eLCFN2N7Myk34B-bNABmWsPA=/0x0:0x0/750x500/data/photo/2021/12/07/61aec5d337a68.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "DONASI BENCANA SEMERU",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  LinearPercentIndicator(
                    width: 175,
                    lineHeight: 10.0,
                    percent: 1 - (0.2),
                    backgroundColor: secondaryTextColor,
                    progressColor: primaryColor,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Rp. 1,000,000",
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            )
    
          ],
        ),
      ),
    );
  }
}