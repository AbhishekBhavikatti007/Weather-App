// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double temp_Max;
  final double temp_Min;
  final String name;
  final String country;
  final DateTime lastupdated;
  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.temp_Max,
    required this.temp_Min,
    required this.name,
    required this.country,
    required this.lastupdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'[0]];
    final main = json['main'];
    return Weather(
        description: weather['description'],
        icon: weather['icon'],
        temp: weather['temp'],
        temp_Max: weather['temp_Max'],
        temp_Min: weather['temp_Min'],
        name: '',
        country: '',
        lastupdated: DateTime.now());
  }

  factory Weather.inital(Map<String, dynamic> json){
    return Weather(description: '', icon: '', temp: 100.0, temp_Max: 100.0, temp_Min: 100.0, name: '', country: '', lastupdated: DateTime(1970));
  }

  @override
  String toString() {
    return 'Waether(description: $description, icon: $icon, temp: $temp, tempMax: $temp_Max, tempMin: $temp_Min, name: $name, countyr: $country, lastupdated: $lastupdated)';
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [description, icon, temp, temp_Max, temp_Min, name, country, lastupdated];

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMax,
    double? tempMin,
    String? name,
    String? country,
    DateTime? lastupdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      temp_Max: tempMax ?? this.temp_Max,
      temp_Min: tempMin ?? this.temp_Min,
      name: name ?? this.name,
      country: country ?? this.country,
      lastupdated: lastupdated ?? this.lastupdated,
    );
  }
}
