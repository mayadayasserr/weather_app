import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    // print(jsonData);

    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }

  @override
 String getImage()
  {
    if(weatherStateName == "Thunderstorm" || weatherStateName == "Thunder"){
      return "assets/images/thunderstorm.png" ;
    }
    else if(weatherStateName == "Clear" || weatherStateName == "Light cloud"){
      return "assets/images/clear.png" ;
    }
    else if(weatherStateName == "Sleet" || weatherStateName == "Snow" || weatherStateName == "Hail"){
      return "assets/images/snow.png" ;
    }
    else if(weatherStateName == "Heavy Cloud"){
      return "assets/images/cloudy.png" ;
    }
    else if(weatherStateName == "Light rain" || weatherStateName == "Heavy rain" ||weatherStateName == "Showers"
    || weatherStateName == "Patchy rain possible" || weatherStateName == "Moderate rain"){
      return "assets/images/rainy.png";
    }
    else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor getThemeColor()
  {
    if(weatherStateName == "Thunderstorm" || weatherStateName == "Thunder"){
      return Colors.amber ;
    }
    else if(weatherStateName == "Clear" || weatherStateName == "Light cloud"){
      return Colors.cyan ;
    }
    else if(weatherStateName == "Sleet" || weatherStateName == "Snow" || weatherStateName == "Hail"){
      return Colors.blueGrey ;
    }
    else if(weatherStateName == "Heavy Cloud"){
      return Colors.grey ;
    }
    else if(weatherStateName == "Light rain" || weatherStateName == "Heavy rain" ||weatherStateName == "Showers"
        || weatherStateName == "Patchy rain possible" || weatherStateName == "Moderate rain" ){
      return Colors.blue;
    }
    else {
      return Colors.amber;
    }
  }
}
