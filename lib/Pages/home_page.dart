//this is required becauses we use fetch  in this page
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app_cubit/Services/weather_api_services.dart';
import 'package:weather_app_cubit/respositories/weather_respository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _featchweather();
  }
  _featchweather(){
    WeatherRespository(weatherApiServices:WeatherApiServices (httpClient: http.Client())).featchWeather('London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("weather"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:  Center(
        child:  Text('weather'),
      ),
    );
  }
}