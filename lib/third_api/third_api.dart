import 'dart:convert';

import 'package:chpt_10_asif_taj/third_api/ThirdUserModal2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ThirdApiComplexModel extends StatefulWidget {
  const ThirdApiComplexModel({Key? key}) : super(key: key);

  @override
  State<ThirdApiComplexModel> createState() => _ThirdApiComplexModelState();
}

class _ThirdApiComplexModelState extends State<ThirdApiComplexModel> {
  final List<ThirdUserModal2> _userList = [];

  Future<List<ThirdUserModal2>?> thirdModelApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    print(response.body);
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        _userList.add(ThirdUserModal2.fromJson(i));
        if(i == _userList.length ){
          continue;
        }
      }

      return _userList;
    } else {
      return _userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Api with plugin  UserModal"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: thirdModelApi(),
              builder:
                  (context, AsyncSnapshot<List<ThirdUserModal2>?> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        itemCount: _userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFef629f),
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Text(
                                              _userList[index].id.toString())),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data![index].name.toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),



                                  ],
                                ),

                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(_userList[index].name.toString(),style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data![index].email.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),


                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].username.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.zipcode.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                   ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.suite.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                     ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.street.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.city.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.geo!.lng.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].address!.geo!.lng.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                              ],
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
