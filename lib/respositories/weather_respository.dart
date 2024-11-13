// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_cubit/Models/customer_error.dart';
import 'package:weather_app_cubit/Models/direct_gecoding.dart';
import 'package:weather_app_cubit/Models/weather.dart';
import 'package:weather_app_cubit/Services/weather_api_services.dart';
import 'package:weather_app_cubit/expections/weather_exception.dart';

class WeatherRespository {
  final WeatherApiServices weatherApiServices;
  WeatherRespository({
    required this.weatherApiServices,
  });

  Future<Weather> featchWeather(String city) async{
    try {
        final DirectGecoding directGecoding = await weatherApiServices.getDirectGecoding(city);
        print(directGecoding);
        final Weather tempWeather = await weatherApiServices.getWeather(directGecoding);
        print(tempWeather);

        final Weather weather = tempWeather.copyWith(name: directGecoding.name, country: directGecoding.country);
        return weather;
    }
     on WeatherException catch (e) 
     {
      throw CustomerError(errMsg: e.message);
    } 
     catch (e) {
      throw CustomerError(errMsg: e.toString());
     }
  }
}
