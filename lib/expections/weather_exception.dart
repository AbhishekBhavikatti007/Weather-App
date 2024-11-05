class WeatherException implements Exception{
  String message;
  WeatherException([this.message = 'something went wrong']){
  }
  @override
  String toString(){
    return message;
  }
}