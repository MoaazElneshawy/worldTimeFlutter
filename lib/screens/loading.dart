import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        locationUrl: 'Africa/Cairo',
        locationName: 'Cairo',
        locationFlag: 'egypt.png');

    bool isTime = await worldTime.getTime();
    if (isTime) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'locationName': worldTime.locationName,
        'locationFlag': worldTime.locationFlag,
        'locationTime': worldTime.locationTime,
        'isDay': worldTime.isDay
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
