import 'package:flutter/material.dart';
import 'package:notice_board_app/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context,listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Favourite List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(builder: (context , value1, child){
                    return ListTile(
                      onTap: () {
                        if(value1.selectedItem.contains(index)){
                          value1.removeItem(index);
                        }else{
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
