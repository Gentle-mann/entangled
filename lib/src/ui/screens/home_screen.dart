import 'package:entangled/src/constants.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/ui/shared/Forecast_tab.dart';
import 'package:entangled/src/ui/shared/default_text.dart';
import 'package:entangled/src/ui/shared/drawer.dart';
import 'package:entangled/src/ui/shared/today_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/weather_forcast.dart';
import '../../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherForecastModel> weatherDetails;
  late List<Forecastday> forecastDay;
  List<Hour> forecastHours = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locationProvider = Provider.of<LocationProvider>(context);
    weatherDetails = WeatherService().getWeatherForecast(
        '${locationProvider.lga} ${locationProvider.state} Nigeria');
    getFutureTimes() async {
      final weather = await weatherDetails;
      final hours = weather.forecast.forecastday[0].hour;
      forecastHours = hours.where((element) {
        final formattedTime =
            DateFormat.H().format(DateTime.parse(element.time));
        return int.parse(formattedTime) > DateTime.now().hour;
      }).toList();
    }

    getFutureTimes();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        return Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            title: DefaultText(
                '${locationProvider.lga}, ${locationProvider.state}'),
            centerTitle: true,
            elevation: 0,
            bottom: const TabBar(
              labelColor: AppColors.kSecondaryColor,
              indicatorColor: AppColors.kSecondaryColor,
              dividerColor: AppColors.kSecondaryColor,
              tabs: [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Forecast',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TodayTab(
                weatherDetails: weatherDetails,
              ),
              ForecastTab(weatherDetails: weatherDetails),
            ],
          ),
        );
      }),
    );
  }
}
