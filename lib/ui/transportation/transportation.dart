import 'package:flutter/material.dart';

import '../../util/my_color.dart';
import '../../util/my_text_style.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({Key? key}) : super(key: key);

  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
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
                      '교통 화면',
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
