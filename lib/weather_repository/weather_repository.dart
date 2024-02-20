
import 'package:flutter_weatherapp/model/weather.dart';
import 'package:weather/weather.dart';

import '../constants/app_constants.dart';

class WeatherRepository{
  
  Future<WeatherInfo> getWeather(String city)async{
    WeatherFactory wf = new WeatherFactory(AppConstants.apiKey);
    Weather weather = await wf.currentWeatherByCityName(city);
  Map<String, dynamic> response = {
    'description': weather.weatherDescription,
    'icon': weather.weatherIcon,
    'temp': weather.temperature?.celsius,
    'temp_min': weather.tempMin?.celsius,
    'temp_max': weather.tempMax?.celsius,
    'name': weather.areaName,
    'country': weather.country,
   'humidity': weather.humidity,
   'wind_speed':weather.windSpeed,
  'weather_icon': weather.weatherIcon
 
    // Include any other necessary fields
  };

    return WeatherInfo.fromJson(response);
  }
}