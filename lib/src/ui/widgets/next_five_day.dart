import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/src/model/daily_summary.dart';
import 'package:weather_app/src/ui/home/home_controller.dart';

class NextFiveDays extends StatelessWidget {
  const NextFiveDays({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Next Five Days'.toUpperCase(),
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 14,
                    fontFamily: 'flutterfonts',
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            height: 150,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => VerticalDivider(
                color: Colors.transparent,
                width: 5,
              ),
              itemCount: (controller.fiveDailyWeather != null)
                  ? controller.fiveDailyWeather.fiveDayList.length
                  : 0,
              itemBuilder: (context, index) {
                DailySummary data;
                (controller.fiveDailyWeather.fiveDayList.length > 0)
                    ? data = controller.fiveDailyWeather.fiveDayList[index]
                    : data = null;
                return Container(
                  width: 140,
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (data != null) ? '${data.date}' : '',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  fontFamily: 'flutterfonts',
                                ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            (data.noonTemp != null)
                                ? '${(data.noonTemp - 273.15).round().toString()}\u2103'
                                : '',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontFamily: 'flutterfonts',
                                ),
                          ),
                          Container(
                            width: 50,
                            height: 45,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: (data.icon != null)
                                    ? NetworkImage(data.iconUrl)
                                    : AssetImage('assets/images/icon-01.jpg'),
                                // image: AssetImage('assets/images/icon-01.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            (data.desc != null) ? '${data.desc}' : '',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.black45,
                                  fontFamily: 'flutterfonts',
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
