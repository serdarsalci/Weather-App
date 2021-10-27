class FiveDayData {
  final String dateTime;
  final int temp;

  FiveDayData({this.dateTime, this.temp});

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }
    //  "dt_txt": "2020-08-04 18:00:00"
    //  for each three hour data create dateTime like 04-18
    var date = json['dt_txt'].split(' ')[0].split('-')[2];
    var hour = json['dt_txt'].split(' ')[1].split(':')[0];
    var dateHour = '$date-$hour';
    return FiveDayData(
      dateTime: '$dateHour',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
