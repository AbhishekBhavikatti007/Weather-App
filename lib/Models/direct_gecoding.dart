// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DirectGecoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;
  DirectGecoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory DirectGecoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];
    return DirectGecoding(
        name: data['name'],
        lat: data['lat'],
        lon: data['lon'],
        country: data['country']);
  }

  @override
  String toString() => 'DirectGecoding(name: $name, lat: $lat, lon: $lon)';

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
