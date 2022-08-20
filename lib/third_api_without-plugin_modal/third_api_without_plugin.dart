import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ThirdApiWithoutPluginModal extends StatefulWidget {
  const ThirdApiWithoutPluginModal({Key? key}) : super(key: key);

  @override
  State<ThirdApiWithoutPluginModal> createState() => _ThirdApiWithoutPluginModalState();
}

class _ThirdApiWithoutPluginModalState extends State<ThirdApiWithoutPluginModal> {
  
  
  var data;
  
Future<void> thirdgetApi() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"),);
  
  if(response.statusCode == 200 ){
    data = jsonDecode(response.body.toString());
  }else{
    // return data;
  }
}  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Api Without Plugin Modal"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: thirdgetApi(),
              builder: (context,AsyncSnapshot  snapahot){
            if(snapahot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.red.withOpacity(0.8),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ID"),
                                  Text(data[index]["id"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name"),
                                  Text(data[index]["name"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Username"),
                                  Text(data[index]["username"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email"),
                                  Text(data[index]["email"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Street"),
                                  Text(data[index]["address"]["street"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Suite"),
                                  Text(data[index]["address"]["suite"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("City"),
                                  Text(data[index]["address"]["city"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Zipcode"),
                                  Text(data[index]["address"]["zipcode"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Lat"),
                                  Text(data[index]["address"]["geo"]["lat"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lng"),
                                  Text(data[index]["address"]["geo"]["lng"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Phone"),
                                  Text(data[index]["phone"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Website"),
                                  Text(data[index]["website"].toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Company Name"),
                                  Text(data[index]["company"]["name"].toString()),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Company catchphrase"),
                                Text(data[index]["company"]["catchPhrase"].toString()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Company BS"),
                                  Text(data[index]["company"]["bs"].toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

