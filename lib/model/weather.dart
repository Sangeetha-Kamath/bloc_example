import 'package:equatable/equatable.dart';

class WeatherInfo extends Equatable{
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final String weatherIcon;
  final double windSpeed;
  final double humidity;
  final DateTime lastUpdated;

  const WeatherInfo({
    required this.description,
    required this.icon,
    required this.weatherIcon,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
    required this.country,
    required this.lastUpdated,
    required this.name

  });
  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    return WeatherInfo(country: json['country'], description: json['description'], 
    weatherIcon: json['weather_icon'],
    windSpeed: json['wind_speed'],
    humidity: json['humidity'],
    icon: json['icon'], temp: json['temp'], tempMin: json['temp_min'], tempMax: json['temp_max'], lastUpdated: DateTime.now(), name:json['name'],);

  }

factory WeatherInfo.initial()=>WeatherInfo(country: "", weatherIcon: '',
windSpeed: 0.0, description: '',humidity: 0.0, icon: '', temp: 100.0, tempMin: 100.0, tempMax: 100.0, lastUpdated: DateTime.now(), name: '');



  @override
  // TODO: implement props
  List<Object> get props{
    return[
        description,
        icon,
        temp,
        tempMin,
        tempMax,
        name,
        country,
        humidity,
        lastUpdated,
        weatherIcon,
        windSpeed
    ];
  }

  WeatherInfo copyWith({
    String? description,
     String? icon,
   double? temp,
   double? tempMin,
   double? tempMax,
   String? name,
   String? country,
   double? humidity,
   String? weatherIcon,
   DateTime? lastUpdated,
   double? windSpeed
  }){
    return WeatherInfo(description: description??this.description, icon: icon??this.icon, 
    weatherIcon: weatherIcon??this.weatherIcon,
    humidity: humidity??this.humidity,
    windSpeed: windSpeed??this.windSpeed,
    temp: temp??this.temp, tempMin: tempMin??this.tempMin, tempMax: tempMax??this.tempMax, country: country??this.country, lastUpdated: lastUpdated??this.lastUpdated, name: name??this.name);
  }

@override
  String toString() {
    // TODO: implement toString
    return ' Weather(description: $description,weatherIcon:$weatherIcon, icon: $icon, temp: $temp, tempMin: $tempMin, tempMax: $tempMax, country: $country, lastUpdated: $lastUpdated, name: $name)';
  }


}