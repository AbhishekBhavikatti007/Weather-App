// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart'  as http;
import 'package:weather_app_cubit/Constants/constants.dart';
import 'package:weather_app_cubit/Models/direct_gecoding.dart';
import 'package:weather_app_cubit/Services/http_error_handler.dart';

class WeatherApiServices {
 final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGecoding> getDirectGecoding(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.9/direct',
        queryParameters: {

        }
    );
    try{
        http.Response response = await httpClient.get(uri);
        if(response.statusCode != 200){
            throw httpErrorHandler(response);
        }
        final responsBody = json.decode(response.body);
    } catch (e){

    }
    

  }
}
