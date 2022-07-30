import 'package:asif_taj_chapter_6/chapter_7.dart';
import 'package:asif_taj_chapter_6/chates.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          bottom: const TabBar(tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text("Chats"),
            ),
            Tab(
              child: Text("Status"),
            ),
            Tab(
              child: Text("Call"),
            ),
          ]),
          actions: [
            const Icon(Icons.search),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                      //  onTap: () async {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ReadMText(),
                      //       ),
                      //     );
                      //  },
                        value: 1,
                        child: Text("New Group"),
                       
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Link Device"),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Settings"),
                      ),
                    ]),
          ],
        ),
        body: const TabBarView(children: [
          Icon(Icons.camera_alt),
          Chates(),
          Chates(),
          Chates(),
        ]),
      ),
    );
  }
}
