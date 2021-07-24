import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weatherapp/data/weather_repository.dart';
import 'package:flutter_weatherapp/models/weather.dart';

import '../../locater.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(InitialWeatherState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event,) async* {

    if(event is FetchWeatherEvent){
      yield WeatherLoadingState();
      try{
        final Weather? getirilenWeather = await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoaded(weather: getirilenWeather);
      }catch(e){
        yield WeatherErrorState();
      }
    }
   
  }
}
