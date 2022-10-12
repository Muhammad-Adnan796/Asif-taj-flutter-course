import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart_provider/cart_modal.dart';
import 'package:shoping_cart_provider/db_helper.dart';
import 'package:shoping_cart_provider/provider_clasess/provider_class.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  DBHelper dbHelper = DBHelper();

  List<String> productName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];

  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];

  List<int> productPrice = [
    10,
    20,
    30,
    40,
    50,
    60,
    70,
  ];

  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              animationDuration: const Duration(milliseconds: 1200),
              animationType: BadgeAnimationType.slide,
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, child) {
                  return  Text(
                    value.getCounter().toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
              child: const Icon(Icons.shopping_cart_rounded),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: height * 0.13,
                                width: width * 0.2,
                                image: NetworkImage(
                                  productImage[index].toString(),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productName[index].toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.002,
                                    ),
                                    Text(
                                      "${productUnit[index].toString()}  \$${productPrice[index].toString()}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  dbHelper
                                      .insert(
                                    CartModal(
                                      id: index,
                                      productId: index.toString(),
                                      productName:
                                          productName[index].toString(),
                                      initialPrice: productPrice[index],
                                      productPrice: productPrice[index],
                                      quantity: 1,
                                      unitTag: productUnit[index].toString(),
                                      image: productImage[index].toString(),
                                    ),
                                  )
                                      .then((value) {
                                    print("Cart Added Succesfully");
                                    cart.addTotalPrice(
                                      productPrice[index].toDouble(),
                                    );
                                    cart.addCounter();
                                  }).onError((error, stackTrace) {
                                    print(error.toString());
                                  });
                                },
                                child: Container(
                                  height: height * 0.06,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
