import 'package:flutter/material.dart';

import '../models/prayer_model.dart';
import '../services/prayer_service.dart';

class PrayerHome extends StatefulWidget {
  const PrayerHome({super.key});

  @override
  State<PrayerHome> createState() => _PrayerHomeState();
}

class _PrayerHomeState extends State<PrayerHome> {
  final cityController = TextEditingController();

  final countryController = TextEditingController();

  final monthController = TextEditingController();

  final service = PrayerService();

  Future<List<PrayerModel>>? prayerFuture;

  void getPrayerTimes() {
    final city = cityController.text.trim();

    final country = countryController.text.trim();

    final month = int.tryParse(
      monthController.text.trim(),
    );

    if (city.isEmpty ||
        country.isEmpty ||
        month == null ||
        month < 1 ||
        month > 12) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter valid city, country and month',
          ),
        ),
      );

      return;
    }

    setState(() {
      prayerFuture = service.getPrayerTimes(
        city: city,
        country: country,
        month: month,
        year: DateTime.now().year,
      );
    });
  }

  @override
  void dispose() {
    cityController.dispose();
    countryController.dispose();
    monthController.dispose();

    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prayer Times',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'e.g. Haripur',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(
                labelText: 'Country',
                hintText: 'e.g. Pakistan',
                prefixIcon: Icon(Icons.public),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: monthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Month',
                hintText: '1 - 12',
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: getPrayerTimes,
                icon: const Icon(
                  Icons.search,
                ),
                label: const Text(
                  'Get Prayer Times',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: prayerFuture == null
                  ? _emptyState()
                  : FutureBuilder<List<PrayerModel>>(
                      future: prayerFuture,
                      builder: (
                        context,
                        snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${snapshot.error}',
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        final prayers = snapshot.data ?? [];

                        if (prayers.isEmpty) {
                          return const Center(
                            child: Text(
                              'No prayer timings found.',
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: prayers.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return _prayerCard(
                              prayers[index],
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mosque,
            size: 70,
            color: Colors.indigo,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Enter your location',
          ),
          Text(
            'to get prayer timings',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _prayerCard(
    PrayerModel prayer,
  ) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prayer.date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _prayerRow(
              'Fajr',
              prayer.fajr,
              Icons.wb_twilight,
            ),
            _prayerRow(
              'Sunrise',
              prayer.sunrise,
              Icons.wb_sunny,
            ),
            _prayerRow(
              'Dhuhr',
              prayer.dhuhr,
              Icons.sunny,
            ),
            _prayerRow(
              'Asr',
              prayer.asr,
              Icons.wb_sunny_outlined,
            ),
            _prayerRow(
              'Maghrib',
              prayer.maghrib,
              Icons.wb_twilight,
            ),
            _prayerRow(
              'Isha',
              prayer.isha,
              Icons.nightlight,
            ),
          ],
        ),
      ),
    );
  }

  Widget _prayerRow(
    String name,
    String time,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.indigo,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
