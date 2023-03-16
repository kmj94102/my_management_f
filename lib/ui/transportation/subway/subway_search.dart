import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_management_f/database/subway.dart';
import 'package:my_management_f/ui/custom/common_header.dart';
import 'package:my_management_f/ui/custom/dashed_line.dart';
import 'package:my_management_f/util/common_util.dart';
import 'package:my_management_f/util/my_color.dart';
import 'package:my_management_f/util/my_text_style.dart';

import '../../../database/model/station_item.dart';
import '../../../database/model/subway_line.dart';
import '../../custom/subway_line.dart';

class SubwaySearchScreen extends StatefulWidget {
  const SubwaySearchScreen({Key? key}) : super(key: key);

  @override
  State<SubwaySearchScreen> createState() => _SubwaySearchScreenState();
}

class _SubwaySearchScreenState extends State<SubwaySearchScreen> {
  String start = "가능";
  String end = "도봉산";
  List<StationItem> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchStationItems();
  }

  void fetchStationItems() async {
    var stationDb = SubwayDatabase();
    await stationDb.initInsertStations();

    list.addAll(await SubwayDatabase().fetchStationItems());
    setState(() {
      list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColor.white,
      body: Column(
        children: [
          const CommonHeader(title: '지하철 검색'),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: GestureDetector(
                child: destinationCard(
                    startStation: start,
                    endStation: end,
                    onChange: () {
                      setState(() {
                        String temp = start;
                        start = end;
                        end = temp;
                      });
                    }),
              )),
          Flexible(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [for (var item in list) subwayListItem(item: item)],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget destinationCard(
      {String? startStation,
      String? endStation,
      required VoidCallback onChange}) {
    return Card(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: MyColor.green, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      elevation: 0,
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.white,
                              border:
                                  Border.all(color: MyColor.green, width: 1)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                            flex: 5,
                            child:
                                DashedLine(width: double.infinity, height: 1)),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColor.green,
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            start,
                            style: MyTextStyle.style16B,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.white,
                              border:
                                  Border.all(color: MyColor.green, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: GestureDetector(
                              onTap: onChange,
                              child: SvgPicture.asset(
                                '$imagesAddress/ic_change.svg',
                                color: MyColor.green,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(end,
                              style: MyTextStyle.style16B,
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            width: 44,
            height: 63,
            color: MyColor.green,
            margin: const EdgeInsets.all(1),
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                '$imagesAddress/ic_next.svg',
                color: MyColor.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget subwayListItem({required StationItem item}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.stationName,
                style: MyTextStyle.style16B,
              ),
              const SizedBox(
                width: 10,
              ),
              for (var line in item.lineNames.split(','))
                Row(children: [
                  subwayLineClip(
                      lineName: line,
                      color: getSubwayLineByName(lineName: line).color),
                  const SizedBox(
                    width: 5,
                  )
                ]),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.white,
                    border: Border.all(color: MyColor.gray, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "출발",
                    style: MyTextStyle.style12B
                        .copyWith(color: MyColor.gray, height: 0.9),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColor.white,
                    border: Border.all(color: MyColor.gray, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "도착",
                    style: MyTextStyle.style12B
                        .copyWith(color: MyColor.gray, height: 0.9),
                  ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                item.isFavorite
                    ? '$imagesAddress/ic_star.svg'
                    : '$imagesAddress/ic_star_empty.svg',
                width: 30,
                height: 30,
              )
            ],
          ),
        ),
        const Divider(
          color: MyColor.gray,
        )
      ],
    );
  }
}
