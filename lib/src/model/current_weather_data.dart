import 'package:weather_app/src/model/main_weather.dart';
import 'package:weather_app/src/model/weather.dart';

class CurrentWeatherData {
  final List<Weather> weather;
  final String base;
  final MainWeather main;
  final int dt;
  final int id;
  final String name;
  final int cod;
  final String icon;
  final String iconUrl;

  CurrentWeatherData(
      {this.weather,
      this.base,
      this.main,
      this.dt,
      this.id,
      this.name,
      this.icon,
      this.iconUrl,
      this.cod});

  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }
    var _icon = json['weather'][0]['icon'];
    print(_icon);

    return CurrentWeatherData(
        weather: (json['weather'] as List)
                ?.map((w) => Weather.fromJson(w))
                ?.toList() ??
            List.empty(),
        base: json['base'],
        main: MainWeather.fromJson(json['main']),
        dt: json['dt'],
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
        icon: _icon,
        iconUrl: "https://openweathermap.org/img/wn/$_icon@2x.png");
  }
}
