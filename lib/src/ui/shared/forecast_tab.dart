import 'package:entangled/src/constants.dart';
import 'package:entangled/src/ui/shared/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../models/weather_forcast.dart';

class ForecastTab extends StatefulWidget {
  const ForecastTab({super.key, required this.weatherDetails});
  final Future<WeatherForecastModel> weatherDetails;

  @override
  State<ForecastTab> createState() => _ForecastTabState();
}

class _ForecastTabState extends State<ForecastTab> {
  List<Hour> forecastHours = [];
  List<Forecastday> forecastDays = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getFutureTimes() async {
      final weather = await widget.weatherDetails;

      forecastDays = weather.forecast.forecastday;

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
    return FutureBuilder(
        future: widget.weatherDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          }
          final data = snapshot.data!.forecast.forecastday;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        data.length,
                        (index) {
                          return ForecastDaysWeather(day: data[index]);
                        },
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: AppColors.kPrimaryColor.withOpacity(0.8),
                  //   ),
                  //   child: const DefaultText('Chart'),
                  // ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final day = data[index].day;
                          final formattedDay = DateFormat.E()
                              .format(DateTime.parse(data[index].date));
                          final formattedDate = DateFormat.MMMd()
                              .format(DateTime.parse(data[index].date));

                          return Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.kSecondaryColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    DefaultText(
                                      formattedDay,
                                      fontSize: 12,
                                    ),
                                    DefaultText(
                                      formattedDate,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/${day.condition.text.toLowerCase().replaceAll(' ', '')}.png',
                                      height: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      children: [
                                        DefaultText(
                                          day.condition.text,
                                          fontSize: 15,
                                        ),
                                        DefaultText(
                                          'SSW ${day.maxwindKph.round()} km/h',
                                          fontSize: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    DefaultText(
                                      '${day.maxtempC.round()}°/${day.mintempC.round()}°',
                                      bold: true,
                                      fontSize: 15,
                                    ),
                                    DefaultText(
                                      '${day.avghumidity.round()}%',
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.white70,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class ForecastDaysWeather extends StatelessWidget {
  const ForecastDaysWeather({
    super.key,
    required this.day,
  });

  final Forecastday day;

  @override
  Widget build(BuildContext context) {
    final formattedDay = DateFormat.E().format(DateTime.parse(day.date));
    return Column(
      children: [
        Image.asset(
          'assets/images/${day.day.condition.text.replaceAll(' ', '').toLowerCase()}.png',
          height: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultText(
          formattedDay,
          fontSize: 15,
        ),
        const SizedBox(height: 10),
        DefaultText(
          '${day.day.avgtempC.round()}°',
          bold: true,
          fontSize: 15,
        ),
      ],
    );
  }
}
