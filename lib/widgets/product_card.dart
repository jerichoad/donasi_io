import 'dart:convert';

import 'package:donasi_io/class/campaign.dart';
import 'package:donasi_io/pages/detailproduct_page.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  ProductCard({Key? key}) : super(key: key);
  
  int indexContext = 1;

  Future<String> fetchData() async {
    final response = await http
      .get(Uri.parse("http://ubaya.fun/flutter/160418108/campaign/campaignurgent.php"));
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

  Widget DaftarCampaignUrgent(data){
    List<Campaign> CPs2 = [];
    Map json = jsonDecode(data);
    for (var cam in json['data']){
      Campaign cmp = Campaign.fromJson(cam);
      CPs2.add(cmp);
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: CPs2.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext ctxt, int index){
        return GestureDetector(
          onTap: (){
            indexContext = index;
            print(indexContext.toString());
          },
          child: new Container(
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
                'http://ubaya.fun/flutter/160418108/campaign/image/' + CPs2[index].idcampaign.toString() + ".jpg",
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
                    CPs2[index].namacampaign,
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
                    CPs2[index].target.toString(),
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
            
          ],),
              ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => DetailProductPage(idcampaign: indexContext))
        );
      },
      child: Container(
          height: 310,
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DaftarCampaignUrgent(snapshot.data);
              } else {
                return Center(
                  child: CircularProgressIndicator()
                );
              }
            },
            
          )
        ),
    );
  }
}