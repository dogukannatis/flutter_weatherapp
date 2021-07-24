part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent(List<String> list);
}

class FetchWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  FetchWeatherEvent({required this.sehirAdi}) : super([sehirAdi]);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
