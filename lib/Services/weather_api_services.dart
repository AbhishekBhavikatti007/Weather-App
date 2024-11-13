// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart'  as http;
import 'package:weather_app_cubit/Constants/constants.dart';
import 'package:weather_app_cubit/Models/direct_gecoding.dart';
import 'package:weather_app_cubit/Models/weather.dart';
import 'package:weather_app_cubit/Services/http_error_handler.dart';
import 'package:weather_app_cubit/expections/weather_exception.dart';

class WeatherApiServices {
 final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGecoding> getDirectGecoding(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q':city,
          'limit': kLimit,
          'appid': dotenv.env['APPID']
        }
    );
    try{
       final http.Response response = await httpClient.get(uri);
        if(response.statusCode != 200){
          // httpErrorHandler is coming from http_error_handler file
            throw httpErrorHandler(response);
        }
        final responseBody = json.decode(response.body);

        if(responseBody.toString().isEmpty){
          throw WeatherException('Cannot get the location of the $city');
        }
        final directGecoding = DirectGecoding.fromJson(responseBody);

        return directGecoding;
    } catch (e){
      //here the error is thrown back to the calling side without any special error handling
        rethrow;
    }
     
  }
  Future<Weather> getWeather (DirectGecoding directGecoding) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: '/data/2.5/weather',
      queryParameters: {
        'lat': '${directGecoding.lat}',
        'lon': '${directGecoding.lon}',
        'units': kUnit,
        'appid': dotenv.env['APPID'],
      }

    );

    try{
      final http.Response response = await httpClient.get(uri);

      if(response.body != 200){
        throw httpErrorHandler(response);
      }

      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);
      return weather;
      }
    
     catch (e)
    {
      rethrow;
    }
  }
}
