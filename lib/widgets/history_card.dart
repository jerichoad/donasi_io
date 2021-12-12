import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor2,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://asset.kompas.com/crops/Nq9eLCFN2N7Myk34B-bNABmWsPA=/0x0:0x0/750x500/data/photo/2021/12/07/61aec5d337a68.jpg',
              width: 100,
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
                  'NAME',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. 500,000',
                  style: blueTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                      'DELETE',
                      style: alertTextStyle,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}