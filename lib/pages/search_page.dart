import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {


  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search a City"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onSubmitted: (data){
              cityName = data;
              WeatherService service = WeatherService();
              service.getWeather(cityName: cityName!);
            },

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              label: Text("search"),
              hintText: "Enter city name",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search,color: Colors.pinkAccent[100],)
          ),),
        ),
      ),

    );
  }
}
