import 'package:flutter/cupertino.dart';
import 'package:my_management_f/util/my_color.dart';
import 'package:my_management_f/util/my_text_style.dart';

Widget subwayLineClip({required String lineName, required Color color}) {
  return Container(
    height: 20,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      child: Text(
        lineName,
        style: MyTextStyle.style12B.copyWith(color: MyColor.white),
      ),
    ),
  );
}
