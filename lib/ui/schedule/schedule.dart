import 'package:flutter/material.dart';

import '../../util/my_color.dart';
import '../../util/my_text_style.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
                      '일정 화면',
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
