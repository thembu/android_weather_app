

import 'package:flutter/material.dart';
import 'package:weather_app/GetWeather.dart';
import 'package:weather_app/Home.dart';
import 'package:weather_app/chooseLocation.dart';
import 'package:weather_app/loading.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => chooseLocation(),
      '/Home' : (context) => Home(),
      'load' : (context) => Loading(),
    },
  ));

}

