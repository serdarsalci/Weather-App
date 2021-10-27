import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/src/ui/home/home_controller.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);

  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: TextField(
          controller: searchText,
          onChanged: (value) {
            controller.city = value;
          },
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            controller.updateWeather();
            searchText.clear();
          },
          decoration: InputDecoration(
            suffix: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            hintText: 'Search'.toUpperCase(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
