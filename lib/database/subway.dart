import 'package:flutter/services.dart' show rootBundle;
import 'package:my_management_f/database/model/station_item.dart';
import 'package:my_management_f/database/my_database.dart';
import 'package:sqflite/sqflite.dart';

class SubwayDatabase {
  static final SubwayDatabase _instance = SubwayDatabase._internal();

  factory SubwayDatabase() {
    return _instance;
  }

  SubwayDatabase._internal();

  final DatabaseHelper _helper = DatabaseHelper();

  Future<List<List<String>>> readCsvData() async {
    final csvString =
        await rootBundle.loadString('assets/csv/station_info.csv');
    final lines = csvString.split('\n');

    final csvData = lines.skip(1).map((line) => line.split(',')).toList();
    return csvData;
  }

  Future<void> initInsertStations() async {
    final db = await _helper.database;
    db.transaction((txn) async {
      var result =
          await txn.rawQuery('SELECT COUNT(*) FROM ${_helper.stationTable}');
      final count = Sqflite.firstIntValue(result) ?? 0;

      if (count == 0) {
        final csvData = await readCsvData();

        for (var item in csvData) {
          final data = {
            'lineNum': item[0],
            'lineName': item[1],
            'stationId': item[2],
            'stationName': item[3].replaceAll('&', ','),
            'stationCode': item[4].padLeft(4, '0'),
            'outerCode': item[5],
          };
          await txn.insert(_helper.stationTable, data,
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
    });
  }

  Future<List<StationItem>> fetchStationItems() async {
    final db = await _helper.database;

    String query = '''
      SELECT stationCode, stationId, stationName, group_concat(lineName,  ',') lineNames, CASE WHEN Favorite.id IS NULL THEN 0 ELSE 1 END AS isFavorite
      FROM ${DatabaseHelper().stationTable} as Station
      LEFT JOIN ${DatabaseHelper().favoriteTable} as Favorite
      ON Station.stationCode = Favorite.id
      WHERE stationName LIKE '%' || '' || '%' AND isFavorite IN (0, 1)
      GROUP BY stationName
      ORDER BY isFavorite DESC, stationName ASC
    ''';
    List<Map<String, dynamic>> result = await db.rawQuery(query);

    return result.isNotEmpty
        ? result.map((item) => StationItem.fromJson(item)).toList()
        : [];
  }
}
