import 'package:covid_tracker_app/Services/routes_name.dart';
import 'package:covid_tracker_app/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              cursorColor: Colors.white,
              controller: _controller,
              onChanged: (val) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                filled: true,
                fillColor: Colors.grey.shade800,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search with county name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServices.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    
                    itemCount: 10,
                    itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                height: height * 0.025,
                                width: width * 0.9,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Container(
                              height: height * 0.025,
                              width: width * 0.9,
                              color: Colors.white,
                            ),
                            leading: Container(
                              height: height * 0.07,
                              width: width * 0.14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                } else {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]["country"];
                        if (_controller.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                child: ListTile(
                                    title: Text(snapshot.data![index]["country"]
                                        .toString()),
                                    subtitle: Text(snapshot.data![index]
                                            ["cases"]
                                        .toString()),
                                    leading: Image(
                                      height: height * 0.15,
                                      width: width * 0.15,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"]),
                                    )),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.countrysdetailscreen,
                                      arguments: {
                                        "image": snapshot.data![index]
                                                ["countryInfo"]["flag"]
                                            .toString(),
                                        "name": snapshot.data![index]["country"]
                                            .toString(),
                                        "totalCases": snapshot.data![index]
                                                ["cases"]
                                            .toString(),
                                        "totalDeaths": snapshot.data![index]
                                                ["deaths"]
                                            .toString(),
                                        "totalRecovered": snapshot.data![index]
                                                ["recovered"]
                                            .toString(),
                                        "active": snapshot.data![index]
                                                ["active"]
                                            .toString(),
                                        "critical": snapshot.data![index]
                                                ["critical"]
                                            .toString(),
                                        "todayRecovered": snapshot.data![index]
                                                ["todayRecovered"]
                                            .toString(),
                                        "test": snapshot.data![index]["tests"]
                                            .toString(),
                                      });
                                },
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                child: ListTile(
                                    title: Text(snapshot.data![index]["country"]
                                        .toString()),
                                    subtitle: Text(snapshot.data![index]
                                            ["cases"]
                                        .toString()),
                                    leading: Image(
                                      height: height * 0.15,
                                      width: width * 0.15,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"]),
                                    )),
                                onTap: (){
                                  Navigator.pushNamed(
                                      context, RoutesName.countrysdetailscreen,
                                      arguments: {
                                        "image": snapshot.data![index]
                                        ["countryInfo"]["flag"]
                                            .toString(),
                                        "name": snapshot.data![index]["country"]
                                            .toString(),
                                        "totalCases": snapshot.data![index]
                                        ["cases"]
                                            .toString(),
                                        "totalDeaths": snapshot.data![index]
                                        ["deaths"]
                                            .toString(),
                                        "totalRecovered": snapshot.data![index]
                                        ["recovered"]
                                            .toString(),
                                        "active": snapshot.data![index]
                                        ["active"]
                                            .toString(),
                                        "critical": snapshot.data![index]
                                        ["critical"]
                                            .toString(),
                                        "todayRecovered": snapshot.data![index]
                                        ["todayRecovered"]
                                            .toString(),
                                        "test": snapshot.data![index]["tests"]
                                            .toString(),
                                      });
                                },
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      });
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
