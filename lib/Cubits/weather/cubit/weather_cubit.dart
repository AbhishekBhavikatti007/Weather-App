import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cubit/Models/customer_error.dart';
import 'package:weather_app_cubit/Models/weather.dart';
import 'package:weather_app_cubit/respositories/weather_respository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherRespository weatherRepository;
  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> fetachWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try 
    {
        final Weather weather = await weatherRepository.featchWeather(city);
        emit(state.copyWith(status: WeatherStatus.loaded,weather: weather));
        print('state:$state');
    } on CustomerError catch (e) {
      emit(state.copyWith(status: WeatherStatus.error, error: e));
      print('state:$state');
    }
  }
}
