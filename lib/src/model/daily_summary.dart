import 'package:intl/intl.dart';

class DailySummary {
  final String date;
  final int noonTemp;
  final int minTemp;
  final int maxTemp;
  final String icon;
  final String desc;
  final String iconUrl;

  DailySummary(
      {this.date,
      this.noonTemp,
      this.minTemp,
      this.maxTemp,
      this.icon,
      this.desc,
      this.iconUrl});

  factory DailySummary.fromJson(List list) {
    if (list == null) {
      return DailySummary();
    }
    //  get the max daily temperature
    var _maxTemp = list
        .map((e) => e['main']['temp_max'])
        .toList()
        .reduce((current, next) => current > next ? current : next)
        .toInt();

    //  get the min daily temperature
    var _minTemp = list
        .map((e) => e['main']['temp_min'])
        .toList()
        .reduce((current, next) => current < next ? current : next)
        .toInt();

    var _date = list[0]['dt_txt'].toString().substring(0, 10).trim();

    //  get todays date as yyyy-MM-dd compare to dates if today _date is today otherwise name of the weekday
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String today = formatter.format(now);
    if (_date == today) {
      _date = 'Today';
    } else {
      _date = DateFormat('EEEE').format(DateFormat('yyyy-MM-dd').parse(_date));
    }

    //  for next five days get noon temperature if exists
    var _noon = list
        .where((b) => b['dt_txt'].substring(10, 19).trim() == '12:00:00')
        .toList();
    var _noonTemp;
    String _desc;
    var _icon;
    if (_noon.length > 0) {
      _noonTemp = _noon[0]['main']['temp'].toInt();
      _icon = _noon[0]['weather'][0]['icon'];
      _desc = _noon[0]['weather'][0]['description'];
    } else {
      _noonTemp = list[0]['main']['temp'].toInt();
      _icon = list[0]['weather'][0]['icon'];
      _desc = list[0]['weather'][0]['description'];
    }

    return DailySummary(
        maxTemp: _maxTemp,
        minTemp: _minTemp,
        noonTemp: _noonTemp,
        date: _date,
        icon: _icon,
        desc: _desc,
        iconUrl: (_icon != null)
            ? "https://openweathermap.org/img/wn/$_icon@2x.png"
            : "https://openweathermap.org/img/wn/10d@2x.png");
  }
}
