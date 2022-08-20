import 'dart:convert';
import 'package:chpt_10_asif_taj/practice_first_api/second_api_post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondApi extends StatefulWidget {
  const SecondApi({Key? key}) : super(key: key);

  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  List<PostModal2> postlist2 = [];

  Future<List<PostModal2>?> secondGetApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"),
    );
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist2.add(PostModal2.fromJson(i));
      }
      return postlist2;
    } else {
      return postlist2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Api"),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: secondGetApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                        itemCount: postlist2.length,
                        itemBuilder: (context, index) {
                      
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(0.8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(postlist2[index].id.toString()),
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(postlist2[index].postId.toString()),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Email: " + postlist2[index].email.toString()),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Name: " +postlist2[index].name.toString()),
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(postlist2[index].body.toString())),
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
