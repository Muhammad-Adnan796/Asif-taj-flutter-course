import 'package:chpt_10_asif_taj/first_api/1st_api.dart';
import 'package:chpt_10_asif_taj/fourth_complex_api_plugin/fourth_complex_api.dart';
import 'package:chpt_10_asif_taj/post_api/signup_post_api.dart';
import 'package:chpt_10_asif_taj/practice_first_api/second_api.dart';
import 'package:chpt_10_asif_taj/second_api/second_api_own_modal.dart';
import 'package:chpt_10_asif_taj/third_api/third_api.dart';
import 'package:chpt_10_asif_taj/third_api_without-plugin_modal/third_api_without_plugin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostSignupApi(),
      // FourthComplexApi()
      // ThirdApiWithoutPluginModal()
      // ThirdApiComplexModel(),
      // SecondApiOwnModal()
      // SecondApi()
      //  FirstApi(),
    );
  }
}
