import 'package:flutter/material.dart';
import 'package:notice_board_app/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class SliderExampleScreen extends StatefulWidget {
  const SliderExampleScreen({Key? key}) : super(key: key);

  @override
  State<SliderExampleScreen> createState() => _SliderExampleScreenState();
}

class _SliderExampleScreenState extends State<SliderExampleScreen> {

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Example One Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderexampleProvider>(builder: (context, value1, child){
            return Slider(
                min: 0,
                max: 1,
                value: value1.value,
                onChanged: (val) {
                  value1.setState(val);
                });
          }),
          Consumer<SliderexampleProvider>(builder: (context, value1, child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green.withOpacity(value1.value),
                    height: 100,
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.withOpacity(value1.value),
                    height: 100,
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                )
              ],
            );
          }),

        ],
      ),
    );
  }
}
