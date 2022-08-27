import 'package:covid_tracker_app/Modal/worldstatemodal.dart';
import 'package:covid_tracker_app/Services/routes_name.dart';
import 'package:covid_tracker_app/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.02),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            StreamBuilder(
                stream: statesServices.fetchWorldStatesRecordes(),
                builder: (context, AsyncSnapshot<Worldstatemodal> snapshot) {
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
                            "Total": snapshot.data!.cases!.toDouble(),
                            "Recovered": snapshot.data!.recovered!.toDouble(),
                            "Death": snapshot.data!.deaths!.toDouble(),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            chartValueStyle: TextStyle(
                              fontSize: 30 / 2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartRadius: width / 3.7,
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
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.06),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30 / 2)),
                            child: Column(
                              children: [
                                ReuseableWidget(
                                  title: "Total",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Deaths",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Recovered",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Active",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Critical",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Today Deaths",
                                  value: snapshot.data!.cases.toString(),
                                ),
                                ReuseableWidget(
                                  title: "Today Recovered",
                                  value: snapshot.data!.cases.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.04,
                            right: width * 0.02,
                            left: width * 0.02,
                          ),
                          child: InkWell(
                            child: Container(
                              height: height * 0.08,
                              width: width,
                              decoration: BoxDecoration(
                                color: const Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                "Track Countries",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.countrieslistscreen,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}

class ReuseableWidget extends StatelessWidget {
  String? title, value;

  ReuseableWidget({
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 13,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
        ],
      ),
    );
  }
}
