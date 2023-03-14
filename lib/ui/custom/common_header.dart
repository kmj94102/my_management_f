import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_management_f/util/common_util.dart';
import 'package:my_management_f/util/my_color.dart';
import 'package:my_management_f/util/my_text_style.dart';

class CommonHeader extends StatefulWidget {
  final String title;

  const CommonHeader({required this.title, Key? key})
      : super(key: key);

  @override
  State<CommonHeader> createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: Card(
          color: MyColor.white,
          elevation: 6,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: Stack(
            children: [
              Positioned(
                  left: 10,
                  top: 10,
                  bottom: 10,
                  child: InkWell(
                    child: SvgPicture.asset('$imagesAddress/ic_prev.svg'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: MyTextStyle.style16B,
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
