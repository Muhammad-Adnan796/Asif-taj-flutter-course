

import 'package:covid_tracker_app/Services/states_services.dart';
import 'package:covid_tracker_app/view/world_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryDetailScreen extends StatefulWidget {
  dynamic data;

  CountryDetailScreen({Key? key, 
    this.data,
  }) : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      seconds: 3,
    ),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorLists = <Color>[
    const Color(0xFF4285f4),
    const Color(0xFF1aa260),
    const Color(0xFFde5246),
  ];
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(widget.data["name"].toString()),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Image(
                height: height * 0.05,
                width: width * 0.13,
                image: NetworkImage(widget.data["image"].toString())),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
              future: statesServices.countriesListApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                      controller: _controller,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                         PieChart(
                    dataMap: {
                      "Total": double.parse(widget.data["totalCases"]),
                      "Recovered": double.parse(widget.data["totalRecovered"]),
                      "Death": double.parse(widget.data["totalDeaths"]),
                    },
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      chartValueStyle: TextStyle(
                        fontSize: 30 / 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartRadius: width / 4.2,
                    legendOptions: const LegendOptions(
                      legendPosition: LegendPosition.left,
                      legendTextStyle: TextStyle(
                        fontSize: 36 / 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    animationDuration: const Duration(milliseconds: 1500),
                    chartType: ChartType.ring,
                    colorList: colorLists,
                  ),

                     Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30 / 2)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.08,
                      ),
                      ReuseableWidget(
                        title: "Total Tests",
                        value: widget.data["test"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Total Cases",
                        value: widget.data["totalCases"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Total Deaths",
                        value: widget.data["totalDeaths"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Total Recovered",
                        value: widget.data["totalRecovered"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Active",
                        value: widget.data["active"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Critical",
                        value: widget.data["critical"].toString(),
                      ),
                      ReuseableWidget(
                        title: "Today Recovered",
                        value: widget.data["todayRecovered"].toString(),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 100 / 2,
                  backgroundImage:
                      NetworkImage(widget.data["image"].toString()),
                ),
              )
            ],
          ),
       
               
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}
