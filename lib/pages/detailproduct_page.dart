import 'package:flutter/material.dart';
import 'package:donasi_io/theme.dart';

class DetailProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://asset.kompas.com/crops/Nq9eLCFN2N7Myk34B-bNABmWsPA=/0x0:0x0/750x500/data/photo/2021/12/07/61aec5d337a68.jpg'),
                  fit: BoxFit.cover,
                ),
                color: primaryColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: backgroundColor1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                )
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget konten(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              //NOTE: HEADER
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DONASI PENANGANAN SEMERU',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Category',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //NOTE: PRICE
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donasi Terkumpul',
                    style: whiteTextStyle,
                  ),
                  Text(
                    'Rp. 1,000,000',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  )
                ],
              ),
            ),

            //NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Kabar duka kembali menyelimuti Jawa Timur. Pada Sabtu (04/12/2021) sekitar pukul 15.30 WIB, Gunung Semeru erupsi dan menyebabkan wilayah sekitar lereng gunung menjadi gelap gulita.',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ],
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
                    "Donasi Sekarang",
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

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                header(),
                konten(),
              ],
            ),
          ),
          footer(),
        ],
      ),
    );
  }
}