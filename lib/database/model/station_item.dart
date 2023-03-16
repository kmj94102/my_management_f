import 'dart:convert';

class StationItem {
  final String stationCode;
  final String stationId;
  final String stationName;
  final String lineNames;
  final bool isFavorite;

  StationItem({
    required this.stationCode,
    required this.stationId,
    required this.stationName,
    required this.lineNames,
    required this.isFavorite,
  });

  factory StationItem.fromJson(Map<String, dynamic> json) {
    return StationItem(
      stationCode: json['stationCode'],
      stationId: json['stationId'],
      stationName: json['stationName'],
      lineNames: json['lineNames'],
      isFavorite: json['isFavorite'] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stationCode': stationCode,
      'stationId': stationId,
      'stationName': stationName,
      'lineNames': lineNames,
      'isFavorite': isFavorite,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
