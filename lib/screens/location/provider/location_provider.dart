import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/constants/err_message.dart';
import 'package:flutter_weatherapp/screens/weather/weather_screen.dart';


class LocationProvider with ChangeNotifier {
  TextEditingController cityController = TextEditingController();
  FocusNode cityFocusNode = FocusNode();
 
  int selectedIndex = -1;
  List<City> cities = [];

  void onSelected(int index) {
    selectedIndex = index;
    cityController.text = "";
    notifyListeners();
  }

  void onTextValueChanged() {
    selectedIndex = -1;
    notifyListeners();
  }

  Future<List<City>> getCityList() async {
    cities = await getStateCities('IN', 'KA');

    notifyListeners();
    return cities;
  }

  LocationProvider() {
    getCityList();
  }

  Future<void> onPressed(context) async {
    if (cityController.text == "" && selectedIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 10),
            backgroundColor: Color.fromARGB(255, 145, 174, 198),
            content: Text(ErrorMessage.noCity)),
      );
    } else {
      
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WeatherScreen(
                cityName: cityController.text.isEmpty
                    ? cities[selectedIndex].name
                    : cityController.text,
              )));
    }
  }
}
