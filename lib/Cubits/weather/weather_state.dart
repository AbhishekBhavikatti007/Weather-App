// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loaded,
  loading,
  error,
}

class WeatherState extends Equatable{
  final WeatherStatus status;
  final Weather weather;
  final CustomerError error;

  WeatherState(
      {required this.status, required this.weather, required this.error});

  factory WeatherState.initial(){
    return WeatherState(status: WeatherStatus.initial, weather: Weather.initial(), error: CustomerError());
  }

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomerError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'WeatherState(status: $status, weather: $weather, error: $error)';
      
        @override
        
        List<Object?> get props => [status,weather,error];
}