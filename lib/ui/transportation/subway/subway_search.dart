import 'package:flutter/material.dart';
import 'package:my_management_f/ui/custom/common_header.dart';
import 'package:my_management_f/util/my_color.dart';

class SubwaySearchScreen extends StatefulWidget {
  const SubwaySearchScreen({Key? key}) : super(key: key);

  @override
  State<SubwaySearchScreen> createState() => _SubwaySearchScreenState();
}

class _SubwaySearchScreenState extends State<SubwaySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          const CommonHeader(title: '지하철 검색'),
        ],
      ),
    ));
  }
}
