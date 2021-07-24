import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/weather_bloc.dart';
import 'package:flutter_weatherapp/locater.dart';
import 'package:flutter_weatherapp/widget/wearher_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => WeatherBloc(),
          child: WeatherApp()
      ),
    );
  }
}

