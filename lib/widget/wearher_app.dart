import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/weather_bloc.dart';
import 'package:flutter_weatherapp/widget/sehir_sec.dart';
import 'package:bloc/bloc.dart';
import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'son_guncelleme.dart';

class WeatherApp extends StatelessWidget {

  String kullanicininSectigiSehir ="Ankara";

  @override
  Widget build(BuildContext context) {

    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(onPressed: () async{
            kullanicininSectigiSehir = await Navigator.push(context, MaterialPageRoute(builder: (context) => SehirSecWidget()));
            if(kullanicininSectigiSehir!=null){
              _weatherBloc.add(FetchWeatherEvent(sehirAdi: kullanicininSectigiSehir));
            }
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if(state is InitialWeatherState){
              return Center(child: Text("Sehir Seçiniz"));
            }
            if(state is WeatherLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is WeatherLoaded){
              return ListView(
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Center(child: LocationWidget(secilenSehir: kullanicininSectigiSehir,))),
                  Padding(padding: EdgeInsets.all(8.0), child: Center(child: SonGuncellemeWidget()),),
                  Padding(padding: EdgeInsets.all(8.0), child: Center(child: HavaDurumuResimWidget()),),
                  Padding(padding: EdgeInsets.all(16.0), child: Center(child: MaxveMinSicaklikWidget()),),

                ],
              );
            }
            if(state is WeatherErrorState){
              return Center(child: Text("hata oluştu"),);
            }
            else{
              return Center(child: Text("null"),);
            }


          },
        ),
      ),
    );
  }
}
