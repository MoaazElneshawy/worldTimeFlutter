import 'package:flutter/material.dart';
import 'package:world_time/screens/EditLocation.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/locations': (context) => Locations()
    },
  ));
}
