import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/home/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            (controller.currentWeatherData != null)
                                ? '${controller.currentWeatherData.name}'
                                    .toUpperCase()
                                : '',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.black45,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'flutterfonts',
                                ),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontFamily: 'flutterfonts',
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Column(
                          children: <Widget>[
                            Text(
                              (controller.currentWeatherData.weather != null)
                                  ? '${controller.currentWeatherData.weather[0].description}'
                                  : '',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black45,
                                        fontSize: 22,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              (controller.currentWeatherData.main != null)
                                  ? '${(controller.currentWeatherData.main.temp - 273.15).round().toString()}\u2103'
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                      color: Colors.black45,
                                      fontFamily: 'flutterfonts'),
                            ),
                            Text(
                              (controller.currentWeatherData.main != null)
                                  ? 'min: ${(controller.currentWeatherData.main.tempMin - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main.tempMax - 273.15).round().toString()}\u2103'
                                  : '',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black45,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(controller
                                    .currentWeatherData.iconUrl ??
                                'https://openweathermap.org/img/wn/10d@2x.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
