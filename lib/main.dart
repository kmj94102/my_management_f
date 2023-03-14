import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:my_management_f/ui/home/home.dart';
import 'package:my_management_f/ui/other/other.dart';
import 'package:my_management_f/ui/schedule/schedule.dart';
import 'package:my_management_f/ui/transportation/transportation.dart';
import 'package:my_management_f/util/common_util.dart';
import 'package:my_management_f/util/my_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'key/api_key.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: nativeAppKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  static const List<Widget> _widgets = <Widget>[
    HomeScreen(),
    TransportationScreen(),
    ScheduleScreen(),
    OtherScreen()
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: MyColor.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: Center(
        child: _widgets.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$imagesAddress/ic_home.svg',
                width: 27,
                height: 27,
                color: _selectIndex == 0 ? MyColor.green : MyColor.gray,
              ),
              label: "홈"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$imagesAddress/ic_transportation.svg',
                width: 27,
                height: 27,
                color: _selectIndex == 1 ? MyColor.green : MyColor.gray,
              ),
              label: "교통"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$imagesAddress/ic_calendar.svg',
                width: 27,
                height: 27,
                color: _selectIndex == 2 ? MyColor.green : MyColor.gray,
              ),
              label: "일정"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '$imagesAddress/ic_other.svg',
                width: 27,
                height: 27,
                color: _selectIndex == 3 ? MyColor.green : MyColor.gray,
              ),
              label: "기타"),
        ],
        selectedItemColor: MyColor.green,
        unselectedItemColor: MyColor.gray,
        backgroundColor: MyColor.white,
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
