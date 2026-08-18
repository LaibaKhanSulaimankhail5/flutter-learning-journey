import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/prayer_model.dart';

class PrayerService {
  Future<List<PrayerModel>> getPrayerTimes({
    required String city,
    required String country,
    required int month,
    required int year,
  }) async {
    final url = Uri.parse(
      'https://api.aladhan.com/v1/calendarByCity'
      '?city=$city'
      '&country=$country'
      '&month=$month'
      '&year=$year',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List records = data['data'];

      return records
          .map(
            (item) => PrayerModel.fromJson(item),
          )
          .toList();
    }

    throw Exception(
      'Failed to load prayer timings',
    );
  }
}
