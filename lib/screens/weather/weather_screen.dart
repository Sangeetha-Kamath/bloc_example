import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weatherapp/blocs/blocs.dart';
import 'package:flutter_weatherapp/constants/err_message.dart';
import 'package:flutter_weatherapp/constants/img_constants.dart';
import 'package:flutter_weatherapp/constants/string_constants.dart';
import 'package:flutter_weatherapp/screens/weather/component/temp_component.dart';
import 'package:flutter_weatherapp/screens/weather/component/weather_detail_component.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  const WeatherScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = context.read<WeatherBloc>();

    // Dispatch the FetchWeatherEvent when the widget is built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("initial weather info:${weatherBloc.state.status}");

      weatherBloc.add(FetchWeatherEvent(city: cityName));
    });

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 20.sp),
          title: const Text(StringConstants.weatherDetails),
          backgroundColor: Colors.blue,
        ),
        body: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == WeatherStatus.loaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      WeatherDetailCard(
                        title: StringConstants.city,
                        information: state.weather.name.toString(),
                        img: ImageConstants.city,
                      ),
                      WeatherDetailCard(
                        title: StringConstants.currentTemperature,
                        information:
                            state.weather.temp.roundToDouble().toString(),
                        img: ImageConstants.temperature,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TempComponent(
                              title: StringConstants.minTemp,
                              temp: state.weather.tempMin
                                  .roundToDouble()
                                  .toString()),
                          TempComponent(
                              title: StringConstants.maxTemp,
                              temp: state.weather.tempMax
                                  .roundToDouble()
                                  .toString())
                        ],
                      ),
                      WeatherDetailCard(
                          title: StringConstants.weatherCondition,
                          img: "${state.weather.weatherIcon}.png",
                          information: state.weather.description.toString()),
                      WeatherDetailCard(
                        title: StringConstants.humidity,
                        img: ImageConstants.humidity,
                        information: state.weather.humidity.toString(),
                      ),
                      WeatherDetailCard(
                          title: StringConstants.windSpeed,
                          img: ImageConstants.windSpeed,
                          information: state.weather.windSpeed.toString()),
                    ],
                  ),
                );
              } else if (state.status == WeatherStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              } else if (state.status == WeatherStatus.error) {
                return const Center(child: Text(ErrorMessage.noData));
              } else {
                return const Center(child: Text(ErrorMessage.noData));
              }
            }));
  }
}
