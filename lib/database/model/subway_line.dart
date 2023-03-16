import 'dart:ui';

enum SubwayLine {
  line01(
      code: "1001", routeCode: "1", lineName: "1호선", color: Color(0xFF0D3692)),
  line02(
      code: "1002", routeCode: "2", lineName: "2호선", color: Color(0xFF33A23D)),
  line03(
      code: "1003", routeCode: "3", lineName: "3호선", color: Color(0xFFFE5D10)),
  line04(
      code: "1004", routeCode: "4", lineName: "4호선", color: Color(0xFF00A2D1)),
  line05(
      code: "1005", routeCode: "5", lineName: "5호선", color: Color(0xFF8B50A4)),
  line06(
      code: "1006", routeCode: "6", lineName: "6호선", color: Color(0xFFC55C1D)),
  line07(
      code: "1007", routeCode: "7", lineName: "7호선", color: Color(0xFF54640D)),
  line08(
      code: "1008", routeCode: "8", lineName: "8호선", color: Color(0xFFF14C82)),
  line09(
      code: "1009", routeCode: "9", lineName: "9호선", color: Color(0xFFAA9872)),
  line63(
      code: "1063",
      routeCode: "??",
      lineName: "경의중앙",
      color: Color(0xFF80CAAA)),
  line65(
      code: "1065",
      routeCode: "공항철도",
      lineName: "공항철도",
      color: Color(0xFF3681B7)),
  line67(
      code: "1067", routeCode: "??", lineName: "경춘선", color: Color(0xFF32C6A6)),
  line75(
      code: "1075",
      routeCode: "??",
      lineName: "수인분당선",
      color: Color(0xFFFFCF33)),
  line77(
      code: "1077",
      routeCode: "??",
      lineName: "신분당선",
      color: Color(0xFFFF8C00)),
  line91(
      code: "1091",
      routeCode: "??",
      lineName: "자기부상",
      color: Color(0xFFFFB156)),
  line92(
      code: "1092",
      routeCode: "우이신설선",
      lineName: "우이신설경전철",
      color: Color(0xFFFFB156)),
  line99(
      code: "1099",
      routeCode: "의정부경전철",
      lineName: "의정부경전철",
      color: Color(0xFFFF8C00)),
  unknown(code: "", routeCode: "", lineName: "???", color: Color(0XFF17181D));

  final String code;
  final String routeCode;
  final String lineName;
  final Color color;

  const SubwayLine(
      {required this.code,
      required this.routeCode,
      required this.lineName,
      required this.color});
}

SubwayLine getSubwayLineByName({required String lineName}) {
  return SubwayLine.values.firstWhere((element) => element.lineName == lineName,
      orElse: () => SubwayLine.unknown);
}

SubwayLine getSubwayLineByCode({required String code}) {
  return SubwayLine.values.firstWhere((element) => element.code == code,
      orElse: () => SubwayLine.unknown);
}

Color getLineColorByRouteCode({required String routeCode}) {
  return SubwayLine.values.firstWhere((element) => element.routeCode == routeCode,
      orElse: () => SubwayLine.unknown).color;
}
