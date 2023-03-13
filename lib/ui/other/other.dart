import 'package:flutter/material.dart';

import '../../util/my_color.dart';
import '../../util/my_text_style.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
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
                      'Other 화면',
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
