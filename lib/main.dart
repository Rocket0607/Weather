import 'dart:io' show Platform;
import 'dart:math' as math;
import 'dart:async' as async;

import 'package:Weather/my_flutter_app_icons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'my_flutter_app_icons.dart';

void main() => runApp(MyApp());

/// Top level widget for the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Weather")),
          backgroundColor: Colors.cyan[600],
        ),
        body: Weather(),
      ),
    );
  }
}

class Weather extends StatefulWidget {
  @override
  WeatherState createState() => new WeatherState();
}

class WeatherState extends State<Weather> {
  String temp = "";

  Future getWeather() async {
    temp = await http.read("http://10.0.2.2:5000/weather");
    setState(() {
      temp = temp;
    });
  }

  String wind = "";

  Future getWind() async {
    wind = await http.read("http://10.0.2.2:5000/wind");
    setState(() {
      wind = wind;
    });
  }

  String humidity = "";

  Future getHumidity() async {
    humidity = await http.read("http://10.0.2.2:5000/humidity");
    setState(() {
      humidity = humidity;
    });
  }

  String moon = "";

  Future getMoon() async {
    moon = await http.read("http://10.0.2.2:5000/moon");
    setState(() {
      moon = moon;
    });
  }

  @override
  Widget build(BuildContext context) {
    getWeather();
    getWind();
    getHumidity();
    getMoon();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: 100.0, right: 90.0, bottom: 70.0, top: 100.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.cyan[200], Colors.cyan[400]],
            ),
          ),
          child: Text(
            temp,
            style: TextStyle(
              fontSize: 60.0,
              fontFamily: 'Pacifico',
            ),
          ),
          padding: EdgeInsets.all(70.0),
        ),
        Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(MyFlutterApp.wind),
                title: Text(wind),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MyFlutterApp.droplet),
                title: Text(humidity),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(MyFlutterApp.moon_inv),
                title: Text(moon),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
