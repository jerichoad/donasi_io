import 'dart:convert';

import 'package:donasi_io/class/campaign.dart';
import 'package:flutter/material.dart';
import 'package:donasi_io/theme.dart';
import 'package:http/http.dart' as http;

class DetailProductPage extends StatefulWidget {

  final int idcampaign;

  DetailProductPage({Key? key, required this.idcampaign}) : super(key: key);
  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  Campaign? cm;

  @override
  void initState() {
    super.initState();
    bacaData();
    print("HERE YOU ARE");
    print(widget.idcampaign.toString());
  }

  Future<String> fetchData() async {
    final response = await http.post(
        Uri.parse("http://ubaya.fun/flutter/160418108/campaign/detailcampaign.php"),
        body: {'idcampaign': widget.idcampaign.toString()});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  bacaData() {
    fetchData().then((value) {
      Map json = jsonDecode(value);
      cm = Campaign.fromJson(json['data']);
      setState(() {});
    });
  }

  Future onGoBack(dynamic value) async {
    print("masuk goback");
    setState(() {
    bacaData();
    });
  }

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
                  image: NetworkImage(
                    'http://ubaya.fun/flutter/160418108/campaign/image/' + widget.idcampaign.toString() + ".jpg",
                    ),
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

    Widget tampilData2(data){
      List<Campaign> CPs2 = [];
      Map json = jsonDecode(data);
      for (var cam in json['data']){
        Campaign cmp = Campaign.fromJson(cam);
        CPs2.add(cmp);
      }

      return ListView.builder(
        itemCount: CPs2.length,
        itemBuilder: (BuildContext ctxt, int index){
          return new Container(
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
                          CPs2[0].namacampaign,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          CPs2[0].categories?[index]['namacat'],
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
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
                    'Target Donasi',
                    style: whiteTextStyle,
                  ),
                  Text(
                    CPs2[0].target.toString(),
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
                    CPs2[0].desc,
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
                        /*Text(
                          cm!.donasis?[index]['nama'],
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          cm!.donasis?[index]['komentar'],
                          style: blueTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          cm!.donasis![index]['nominal'].toString(),
                          style: blueTextStyle,
                        )*/
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        );
        },
      );
    }

    Widget bacaKategori(){
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
                          cm!.namacampaign,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cm!.categories?.length,
                          itemBuilder: (BuildContext ctxt, int index){
                            return new Text(
                              cm!.categories?[index]['namacat'],
                              style: secondaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            );
                          },
                          
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      );    
    }

    Widget bacaJudul(){
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
                    'Target Donasi',
                    style: whiteTextStyle,
                  ),
                  Text(
                    cm!.target.toString(),
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
                    cm!.desc,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ]
        )
      );  
    }

    Widget tampilData(){
      bacaData();
      if(cm!=null){
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
                          cm!.namacampaign,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cm!.categories?.length,
                          itemBuilder: (BuildContext ctxt, int index){
                            return new Text(
                              cm!.categories?[index]['namacat'],
                              style: secondaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            );
                          },
                          
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
                    'Target Donasi',
                    style: whiteTextStyle,
                  ),
                  Text(
                    cm!.target.toString(),
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
                    cm!.desc,
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
                          child: ListView.builder(
                            shrinkWrap: true,
                          itemCount: cm!.donasis?.length,
                            itemBuilder: (BuildContext ctxt, int index){
                              return new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cm!.donasis?[index]['nama'],
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    cm!.donasis?[index]['komentar'],
                                    style: blueTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    cm!.donasis![index]['nominal'].toString(),
                                    style: blueTextStyle,
                                  )
                                ],
                              );
                            }
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
      } else {
        return CircularProgressIndicator();
      }
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Expanded(
            child: ListView(
              children: <Widget>[
                tampilData(),
              ],
            ),
          ),
          footer(),
        ],
      ),
    );
  }
}