import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondApiOwnModal extends StatefulWidget {
  const SecondApiOwnModal({Key? key}) : super(key: key);

  @override
  State<SecondApiOwnModal> createState() => _SecondApiOwnModalState();
}

class _SecondApiOwnModalState extends State<SecondApiOwnModal> {
  final List<PostModalCustomSecondApi> _postList = [];

  Future<List<PostModalCustomSecondApi>?> getApiCustomModal() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PostModalCustomSecondApi post = PostModalCustomSecondApi(
          albumId: i["albumId"],
          id: i["id"],
          title: i["title"],
          url: i["url"],
          thumbnailUrl: i["thumbnailUrl"],
        );
        _postList.add(post);
      }
      return _postList;
    } else {
      return _postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Api with custom modal"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getApiCustomModal(),
              builder: (context,
                  AsyncSnapshot<List<PostModalCustomSecondApi>?> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: _postList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 25,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                trailing:
                                    Text(snapshot.data![index].id.toString()),
                                title: Text(
                                    snapshot.data![index].title.toString()),
                                subtitle: Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      snapshot.data![index].url.toString(),
                                      fit: BoxFit.cover,
                                      height: 130,
                                      width: 40,
                                    ),
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    snapshot.data![index].thumbnailUrl
                                        .toString(),
                                  ),
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

class PostModalCustomSecondApi {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PostModalCustomSecondApi({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
}
