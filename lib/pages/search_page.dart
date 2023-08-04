import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';
import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {

  String? cityName;

  SearchPage({super.key, this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for a City",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data) async{
              cityName = data;
              WeatherService service = WeatherService();

              WeatherModel? weather = await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData = weather ; //give me access about the weather object
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName ;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              label: Text("search"),
              hintText: "Enter city name",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                  onTap: () async{
                    WeatherService service = WeatherService();

                    WeatherModel? weather = await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false).weatherData = weather ; //give me access about the weather object
                    Provider.of<WeatherProvider>(context, listen: false).cityName = cityName ;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search,color: Colors.pink,))
          ),),
        ),
      ),
    );
  }
}
