import 'package:weather_app/src/model/daily_summary.dart';
import 'daily_summary.dart';

class FiveDailyWeather {
  final List<DailySummary> fiveDayList;

  FiveDailyWeather({this.fiveDayList});

  factory FiveDailyWeather.fromJson(dynamic json) {
    List<DailySummary> _fiveDayList = [];

    //  Get date from dt string
    String getDate(String date) {
      return date.substring(0, 10);
    }

    if (json == null) {
      return FiveDailyWeather();
    }
    //  get unique dates in set
    Set days = new Set();
    json.forEach((data) {
      days.add(getDate(data['dt_txt']));
    });

    // get 3-hour data for each day
    days.forEach((day) {
      var dt = json.where((data) => getDate(data['dt_txt']) == day).toList();
      List dailyTemps = dt.map((d) => (d)).toList();
      //  get daily summary as five day list
      _fiveDayList.add(DailySummary.fromJson(dailyTemps));
    });

    return FiveDailyWeather(fiveDayList: _fiveDayList);
  }

  @override
  String toString() {
    return '$fiveDayList[0]';
  }
}
