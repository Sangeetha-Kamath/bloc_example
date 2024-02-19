part of 'weather_bloc.dart';

enum WeatherStatus{
  initial,
  loading,
  loaded,
  error
}

 class WeatherState extends Equatable {
  final WeatherInfo weather;
  final WeatherStatus status;
  const WeatherState({
    required this.status,
    required this.weather,
   
  });

  factory WeatherState.initial(){
    return WeatherState(status: WeatherStatus.initial, weather: WeatherInfo.initial() );
  }
  
  @override
  List<Object> get props {return[
    status,weather
  ];
}

@override
  String toString() {
    // TODO: implement toString
    return 'WeatherState(status: $status, weather: $weather)';
  }

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherInfo? weather
  }){
    return WeatherState(status: status??this.status, weather: weather??this.weather);
  }


 }


