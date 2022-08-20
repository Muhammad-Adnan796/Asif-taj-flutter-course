import 'dart:convert';

import 'package:chpt_10_asif_taj/fourth_complex_api_plugin/fourthcomplexapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourthComplexApi extends StatefulWidget {
  const FourthComplexApi({Key? key}) : super(key: key);

  @override
  State<FourthComplexApi> createState() => _FourthComplexApiState();
}

class _FourthComplexApiState extends State<FourthComplexApi> {

  // in this page i have been learn the integration of ecommerce api in this and very complex json


  Future<Fourthcomplexapi> getFourthApi() async {
    final response = await http.get(
      Uri.parse("https://webhook.site/733e9caa-3214-43d0-a1d3-9fdcc8a6e36a"),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Fourthcomplexapi.fromJson(data);
    } else {
      return Fourthcomplexapi.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Complex Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder<Fourthcomplexapi>(
              future: getFourthApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.network(snapshot
                                  .data!.data![index].image
                                  .toString()),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    itemCount: snapshot.data!.data![index]
                                        .products![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.25,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!
                                                .data![index]
                                                .products![index]
                                                .images![position]
                                                .url
                                                .toString()),
                                          ),
                                        ),
                                        child: Image.network(snapshot
                                            .data!
                                            .data![index]
                                            .products![index]
                                            .images![position]
                                            .url
                                            .toString()),
                                      );
                                    }),
                              ),
                            ],
                          );
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}
