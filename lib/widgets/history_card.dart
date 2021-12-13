import 'dart:convert';

import 'package:donasi_io/class/donasi.dart';
import 'package:donasi_io/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class HistoryCard extends StatelessWidget {
  Future<String> fetchData() async {
    /*final response = await http
      .post(Uri.parse("http://ubaya.fun/flutter/160418108/donasi.php"),
      body: {'idaccount': 1});*/
    final response = await http
    .get(Uri.parse("http://ubaya.fun/flutter/160418108/donasi.php"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
    throw Exception('Failed to read API');
    }
  }

  @override
  Widget build(BuildContext context) {

/*
    void deleteGenre(campaign_id) async {
    final response = await http.post(
      Uri.parse("http://ubaya.prototipe.net/160418108/deletemoviegenre.php"),
      body: {
        'genre_id': campaign_id.toString(), 
        'movie_id': widget.movie_id.toString()
      }
    );
    if (response.statusCode == 200) {
      print(response.body);
      Map json = jsonDecode(response.body);
      if (json['result'] == 'success') {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Sukses menghapus genre')));
      setState(() {
        bacaData();
      });
      }
    } else {
      throw Exception('Failed to read API');
    }
  }*/

  void deleteHistory(idcampaign, nominal) async {
    final http.Response response = await http.post(
      Uri.parse("http://ubaya.fun/flutter/160418108/deletehistory.php"),
      body: {
        'idaccount': 1, 
        'idcampaign': idcampaign,
        'nominal': nominal,
      },
    );    
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      if (json['result'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sukses Menambah Data')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal')));
        throw Exception('Failed to read API');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal')));
      throw Exception('Failed to read API');
    }
  }


    Widget DaftarDonasi(data){
      List<Donasi> DNs2 = [];
      Map json = jsonDecode(data);
      for(var don in json['data']){
        Donasi dns = Donasi.fromJson(don);
        DNs2.add(dns);
      }

      return ListView.builder(
          itemCount: DNs2.length,
          itemBuilder: (BuildContext ctxt, int index){
            return new Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'http://ubaya.fun/flutter/160418108/campaign/image/' + DNs2[index].idcampaign.toString() + ".jpg",
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
                      //DNs2[index].campaigns?['namacampaign'];
                      DNs2[index].idcampaign.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DNs2[index].nominal.toString(),
                      style: blueTextStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("HERE YOU GO - idcampaign: " + DNs2[index].idcampaign.toString() + ", Nominal: " + DNs2[index].nominal.toString());
                        deleteHistory(DNs2[index].idcampaign, DNs2[index].nominal);
                      },
                      child: Text(
                        'DELETE',
                        style: alertTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }


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
      height: 120,
      child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DaftarDonasi(snapshot.data);
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