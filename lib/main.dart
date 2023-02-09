import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                  onPressed: () async {
                    try {
                      OAuthToken token =
                          await UserApi.instance.loginWithKakaoAccount();
                      print('카카오톡으로 로그인 성공 ${token.accessToken}');
                      User user = await UserApi.instance.me();
                      print('닉네임 ${user.kakaoAccount?.profile?.nickname}');
                    } catch (error) {
                      print('카카오톡으로 로그인 실패 $error');
                    }
                  },
                  child: const Text('kakao login')),
            )
          ],
        ),
      ),
    );
  }
}
