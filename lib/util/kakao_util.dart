import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:my_management_f/util/common_util.dart';

class KakaoUtil {
  Future<void> login(
      {required Callback onStart,
      required Callback onSuccess,
      required void Function(String) onError,
      required Callback onComplete}) async {
    try {
      onStart();
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
      User user = await UserApi.instance.me();
      print('닉네임 ${user.kakaoAccount?.profile?.nickname}');
      onSuccess();
    } catch (error) {
      onError("카카오톡으로 로그인 실패 $error");
    } finally {
      onComplete();
    }
  }
}
