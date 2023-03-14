import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:my_management_f/ui/transportation/bus/bus_search.dart';
import 'package:my_management_f/ui/transportation/subway/subway_search.dart';
import 'package:my_management_f/util/common_util.dart';

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
            children: [
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: MyColor.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 22, bottom: 20, left: 20),
                      child: Text(
                        '교통',
                        style: MyTextStyle.style24B.copyWith(
                            color: MyColor.white),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Flexible(
                              child:
                              transportationButton(type: "BUS", onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (
                                        BuildContext builder) => const BusSearchScreen()));
                              })),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child:
                              transportationButton(type: "SUBWAY", onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (
                                        BuildContext builder) => const SubwaySearchScreen()));
                              })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '즐겨찾기',
                      style: MyTextStyle.style16B,
                    ),
                    SvgPicture.asset(
                      '$imagesAddress/ic_setting.svg',
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Lottie.asset('$lottieAddress/empty.json', width: 300),
                          Text(
                            '즐겨찾기를 추가해주세요',
                            style: MyTextStyle.style16.copyWith(
                                color: MyColor.gray),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

Widget transportationButton({
  required String type,
  required VoidCallback onPressed,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        side: const BorderSide(color: MyColor.white, width: 1),
        backgroundColor: MyColor.white[30]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: SvgPicture.asset(
            type == "BUS" ? '$imagesAddress/ic_bus.svg' : '$imagesAddress/ic_subway.svg',
            width: 40,
            height: 40,
            color: MyColor.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          type == "BUS" ? '버스\n시간 조회' : '지하철\n시간 조회',
          style: MyTextStyle.style16B.copyWith(color: MyColor.white),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
