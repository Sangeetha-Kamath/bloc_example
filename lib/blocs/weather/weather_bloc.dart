import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weatherapp/weather_repository/weather_repository.dart';

import '../../model/weather.dart';


part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherState.initial()) {
    on<FetchWeatherEvent>((event, emit)async {
      emit(state.copyWith(status: WeatherStatus.loading));
       try {
      final WeatherInfo weather = await weatherRepository.getWeather(event.city);

      emit(state.copyWith(status: WeatherStatus.loaded, weather: weather));
    } catch (e) {
      emit(state.copyWith(status: WeatherStatus.error,));
    }
      
      // TODO: implement event handler
    });
  }
}
