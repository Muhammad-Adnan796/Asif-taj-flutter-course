import 'dart:ui';

import 'package:flutter/material.dart';

class Chates extends StatefulWidget {
  const Chates({Key? key}) : super(key: key);

  @override
  State<Chates> createState() => _ChatesState();
}

class _ChatesState extends State<Chates> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(itemBuilder: (context, index) {
        return Column(
          children: [
            listtileChates("Adnan", Icon(Icons.call), "Missed Call",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvfe6MzlSRY7EAvwaFVpDcQHkN8k1cGRMBQ&usqp=CAU"),
            listtileChates("Adnan", Icon(Icons.call), "Missed Call",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvfe6MzlSRY7EAvwaFVpDcQHkN8k1cGRMBQ&usqp=CAU"),
            listtileChates("Adnan", Icon(Icons.call), "Missed Call",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvfe6MzlSRY7EAvwaFVpDcQHkN8k1cGRMBQ&usqp=CAU"),
            listtileChates("Adnan", Icon(Icons.call), "Missed Call",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvfe6MzlSRY7EAvwaFVpDcQHkN8k1cGRMBQ&usqp=CAU"),
            listtileChates("Adnan", Icon(Icons.call), "Missed Call",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSvfe6MzlSRY7EAvwaFVpDcQHkN8k1cGRMBQ&usqp=CAU"),
          ],
        );
      }),
    );
  }

  ListTile listtileChates(
    var name,
    Icon icons,
    var subtitles,
    var images,
  ) {
    return ListTile(
      title: Text(name),
      trailing: icons,
      subtitle: Text("Missed call!"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(images),
        // radius: 15,
      ),
    );
  }
}
