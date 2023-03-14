import 'package:flutter/material.dart';
import 'package:my_management_f/ui/custom/common_header.dart';
import 'package:my_management_f/util/my_color.dart';

class BusSearchScreen extends StatefulWidget {
  const BusSearchScreen({Key? key}) : super(key: key);

  @override
  State<BusSearchScreen> createState() => _BusSearchScreenState();
}

class _BusSearchScreenState extends State<BusSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.white,
          body: Column(
            children: [
              const CommonHeader(title: '버스 정류소 검색'),
            ],
          ),
        ));
  }
}
