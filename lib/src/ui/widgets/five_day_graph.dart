import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/src/ui/home/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/src/model/five_days_data.dart';

class FiveDayGraph extends StatelessWidget {
  const FiveDayGraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'forcast next 5 days'.toUpperCase(),
                  style: Theme.of(context).textTheme.caption.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                ),
                Icon(
                  Icons.next_plan_outlined,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<FiveDayData, String>>[
                  SplineAreaSeries<FiveDayData, String>(
                    color: Colors.yellow[100],
                    borderColor: Colors.orange[200],
                    borderWidth: 2,
                    dataSource: controller.fiveDaysData,
                    xValueMapper: (FiveDayData f, _) => f.dateTime,
                    yValueMapper: (FiveDayData f, _) => f.temp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
