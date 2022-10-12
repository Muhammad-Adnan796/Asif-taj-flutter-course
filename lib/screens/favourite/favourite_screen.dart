import 'package:flutter/material.dart';
import 'package:notice_board_app/provider/favourite_provider.dart';
import 'package:notice_board_app/screens/favourite/myfavourit.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Favourite App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavouriteItem(),
                ),
              );
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value1, child) {
                    return ListTile(
                      onTap: () {
                        if (value1.selectedItem.contains(index)) {
                          value1.removeItem(index);
                        } else {
                          value1.addItem(index);
                        }
                      },
                      title: Text(
                        "Item" + index.toString(),
                      ),
                      trailing: Icon(
                        value1.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
