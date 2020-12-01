import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String locationName;
  String locationFlag;
  String locationTime;
  String locationUrl;
  bool isDay;

  WorldTime({this.locationName, this.locationFlag, this.locationUrl});

  Future<bool> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$locationUrl");

      Map json = jsonDecode(response.body);

      String datetime = json['datetime'];
      String offset = json['utc_offset'];

      // convert the dateTime to DateTime obj
      DateTime now = DateTime.parse(datetime);
      // add the offset
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      locationTime = DateFormat.jm().format(now);
      isDay = now.hour > 6 && now.hour < 19 ? true : false;

      return true;
    } catch (e) {
      locationTime = "";
      return false;
    }
  }
}
