part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState(List<Weather> list);
}

class InitialWeatherState extends WeatherState {



  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class WeatherLoaded extends WeatherState{

  final Weather? weather;
  WeatherLoaded({required this.weather}) : super([weather]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class WeatherErrorState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}