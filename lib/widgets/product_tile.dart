import 'dart:convert';
import 'package:donasi_io/class/campaign.dart';
import 'package:donasi_io/pages/detailproduct_page.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;


class ProductTile extends StatelessWidget {
  ProductTile({Key? key}) : super(key: key);

  String _temp = 'waiting API respond';

  Future<String> fetchData() async {
    final response = await http
      .get(Uri.parse("http://ubaya.fun/flutter/160418108/campaign/campaignlist.php"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
    throw Exception('Failed to read API');
    }
  }

  bacaData(){
    CPs.clear();
    Future<String> data = fetchData();
    data.then((value){
      Map json = jsonDecode(value);
      for (var cam in json['data']){
        Campaign cm = Campaign.fromJson(cam);
        CPs.add(cm);
      }
      
    });
  }

  Widget DaftarCampaign(data){
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
                  'http://ubaya.fun/flutter/160418108/campaign/image/' + CPs2[index].idcampaign.toString() + ".jpg",
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
                      CPs2[index].namacampaign,
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
                      CPs2[index].target.toString(),
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    initState();
    //bacaData();
  }

  @override
  Widget build(BuildContext context) {

    Widget DaftarCampaign2(data){
    List<Campaign> CPs2 = [];
    Map json = jsonDecode(data);
    for (var cam in json['data']){
      Campaign cmp = Campaign.fromJson(cam);
      CPs2.add(cmp);
    }
    
    return ListView.builder(
      itemCount: CPs2.length,
      itemBuilder: (BuildContext ctxt, int index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => DetailProductPage(idcampaign: CPs2[index].idcampaign))
            );
          },
          child: new Container(
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
                    'http://ubaya.fun/flutter/160418108/campaign/image/' + CPs2[index].idcampaign.toString() + ".jpg",
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
                        CPs2[index].namacampaign,
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
                        CPs2[index].target.toString(),
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
      },
    );
  }


    //print(CPs[0].namacampaign);
    return Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DaftarCampaign2(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator()
              );
            }
          },
          
        )
      );
  }
}