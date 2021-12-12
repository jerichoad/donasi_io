import 'package:flutter/material.dart';
import 'package:donasi_io/theme.dart';

class DetailProductPage extends StatefulWidget {

  final int idcampaign;
  DetailProductPage({Key? key, required this.idcampaign}) : super(key: key);
  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {

    Widget header(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
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
          top: 5,
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
                    'Donatour',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
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
                                'Semoga membantu',
                                style: blueTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rp. 500,000',
                                style: blueTextStyle,
                              )
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
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
                  onPressed: (){
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                            color: Colors.white,
                          ),
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Jumlah Donasi'),
                                SizedBox(height: 20,),
                                TextFormField(
                                  style: primaryTextStyle,
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan Angka',
                                    hintStyle: primaryTextStyle,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      )
                                    )
                                  ),
                                ),

                                TextFormField(
                                  style: primaryTextStyle,
                                  decoration: InputDecoration(
                                    hintText: 'Komentar',
                                    hintStyle: primaryTextStyle,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      )
                                    )
                                  ),
                                ),


                                SizedBox(height: 20,),
                                ElevatedButton(
                                  child: const Text('Donate'),
                                  onPressed: () {
                                    //donasi
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
          header(),
          Expanded(
            child: ListView(
              children: [
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