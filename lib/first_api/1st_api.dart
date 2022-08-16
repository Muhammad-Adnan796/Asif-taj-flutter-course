import 'dart:convert';

import 'package:chpt_10_asif_taj/first_api/first_api_post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirstApi extends StatefulWidget {
  const FirstApi({Key? key}) : super(key: key);

  @override
  State<FirstApi> createState() => _FirstApiState();
}

class _FirstApiState extends State<FirstApi> {
  List<PostModal> postList = [];
  Future<List<PostModal>?> firstgetApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModal.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: firstgetApi(),
              builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(child: Text("Loading"));
            }else{
              return Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: postList.length,
                    itemBuilder: (context,index){
                  return Card(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(

                        title: Text("Title\n"+postList[index].title.toString()),
                        subtitle: Text("Description\n"+postList[index].body.toString()),
                        leading: Text(postList[index].id.toString()),
                        trailing: Text(postList[index].userId.toString()),
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
