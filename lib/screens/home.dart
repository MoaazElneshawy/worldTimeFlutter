import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map locationDetails = {};

  @override
  Widget build(BuildContext context) {
    locationDetails = locationDetails.isEmpty
        ? ModalRoute.of(context).settings.arguments
        : locationDetails;

    String bgImage = locationDetails["isDay"] ? 'day.png' : 'night.png';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic selectedLocation =
              await Navigator.pushNamed(context, '/locations');
          setState(() {
            locationDetails = {
              "locationName": selectedLocation["locationName"],
              "locationFlag": selectedLocation["locationFlag"],
              "locationTime": selectedLocation["locationTime"],
              "isDay": selectedLocation["isDay"],
            };
          });
        },
        child: Icon(Icons.location_on),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 150, 10, 0),
          child: Column(
            children: [
              Text(
                locationDetails["locationName"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )
              ,
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    locationDetails["locationTime"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
