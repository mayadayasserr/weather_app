import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void updateUi()
  {
    setState(() {
    });
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchPage(
                  updateUi: updateUi,
                );
              } ) );},
              icon: Icon(Icons.search,color: Colors.white,))
        ],
        // backgroundColor: Colors.orange,
        title: Text('Weather',style: TextStyle(color: Colors.white),),
      ),


      body: weatherData == null
          ? Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ) : Container(
        // color: weatherData!.getThemeColor(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[400]!,
                weatherData!.getThemeColor()[100]!,
              ]
          )
        ),
        child: Column(
          children: [
            Spacer(flex: 2,),
            Column(
              children: [
                Text(Provider.of<WeatherProvider>(context).cityName!,
                  style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),

                Text("Updated at ${weatherData!.date.toString()}",
                  style: TextStyle(fontSize: 19,color: Colors.white),),
              ],
            ),

            // SizedBox(height: 50,),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(weatherData!.getImage()),
                ),
                Text(weatherData!.temp.toInt().toString(),
                  style: TextStyle(fontSize: 35,fontWeight: FontWeight.normal,color: Colors.white),),

                Column(
                  children: [
                    Text("maxTemp : ${weatherData!.maxTemp.toInt()}",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal,color: Colors.white),),
                    Text("minTemp : ${weatherData!.minTemp.toInt()}",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],
                ),
              ],
            ),

            // SizedBox(height: 50,),
            Spacer(),

            Text(weatherData!.weatherStateName,
              style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),


            Spacer(flex: 5,), //5 اضعاف ال spacer ال فوق
          ],
        ),
      ),
    );
  }
}
