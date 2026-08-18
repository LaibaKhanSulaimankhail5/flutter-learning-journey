class PrayerModel {
  final String date;
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerModel({
    required this.date,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PrayerModel(
      date: json['date']['readable'],
      fajr: json['timings']['Fajr'],
      sunrise: json['timings']['Sunrise'],
      dhuhr: json['timings']['Dhuhr'],
      asr: json['timings']['Asr'],
      maghrib: json['timings']['Maghrib'],
      isha: json['timings']['Isha'],
    );
  }
}
