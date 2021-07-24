import 'package:flutter_weatherapp/data/weather_api_client.dart';
import 'package:flutter_weatherapp/data/weather_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerSingleton(() => WeatherApiClient());
}