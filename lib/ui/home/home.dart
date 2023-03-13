import 'package:flutter/material.dart';
import 'package:my_management_f/util/my_color.dart';
import 'package:my_management_f/util/my_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.white,
          body: Column(
            children: const [
              Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '홈 화면',
                      style: MyTextStyle.style16B,
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
