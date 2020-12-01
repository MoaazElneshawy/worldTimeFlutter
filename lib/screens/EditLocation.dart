import 'package:flutter/material.dart';
import 'package:world_time/WorldTime.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<WorldTime> locations = [
    WorldTime(
        locationUrl: 'Europe/London',
        locationName: 'London',
        locationFlag: 'uk.png'),
    WorldTime(
        locationUrl: 'Europe/Berlin',
        locationName: 'Athens',
        locationFlag: 'greece.png'),
    WorldTime(
        locationUrl: 'Africa/Cairo',
        locationName: 'Cairo',
        locationFlag: 'egypt.png'),
    WorldTime(
        locationUrl: 'Africa/Nairobi',
        locationName: 'Nairobi',
        locationFlag: 'kenya.png'),
    WorldTime(
        locationUrl: 'America/Chicago',
        locationName: 'Chicago',
        locationFlag: 'usa.png'),
    WorldTime(
        locationUrl: 'America/New_York',
        locationName: 'New York',
        locationFlag: 'usa.png'),
    WorldTime(
        locationUrl: 'Asia/Seoul',
        locationName: 'Seoul',
        locationFlag: 'south_korea.png'),
    WorldTime(
        locationUrl: 'Asia/Jakarta',
        locationName: 'Jakarta',
        locationFlag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Select Location'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  WorldTime worldTime = locations[index];
                  bool isTimeOk = await worldTime.getTime();
                  if (isTimeOk) {
                    Navigator.pop(context, {
                      'locationName': worldTime.locationName,
                      'locationFlag': worldTime.locationFlag,
                      'locationTime': worldTime.locationTime,
                      'isDay': worldTime.isDay
                    });
                  }
                },
                title: Text(locations[index].locationName),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].locationFlag}'),
                ),
              ),
            );
          }),
    );
  }
}
