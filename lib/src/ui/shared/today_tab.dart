import 'package:entangled/src/constants.dart';
import 'package:entangled/src/models/weather_forcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'shared.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({super.key, required this.weatherDetails});
  final Future<WeatherForecastModel> weatherDetails;

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  late List<Forecastday> forecastDay;
  List<Hour> forecastHours = [];
  int selectedHourForecast = 0;
  int itemCount = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getFutureTimes() async {
      final weather = await widget.weatherDetails;
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
    if (forecastHours.length < 7) {
      itemCount = forecastHours.length;
    }
    return FutureBuilder(
        future: widget.weatherDetails,
        builder: (context, snapshot) {
          //print(forecastHours.length);
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(child: DefaultText('${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(
              child: DefaultText('No data'),
            );
          } else {
            final dateTime = DateTime.tryParse(data!.location.localtime);
            final date =
                DateFormat.MMMMEEEEd().format(dateTime ?? DateTime.now());
            return Padding(
              padding: EdgeInsets.only(top: 20.h, left: 10.h),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kSecondaryColor,
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: DefaultText(
                      date.toString(),
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/${data.current.condition.text.toLowerCase().replaceAll(' ', '')}.png',
                                height: 100,
                              ),
                              const SizedBox(height: 20),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(
                                      color: AppColors.kSecondaryColor),
                                  children: [
                                    const TextSpan(
                                      text: 'Feels like ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextSpan(
                                      text:
                                          '${data.current.feelslikeC.round()}°C',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text.rich(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColors.kSecondaryColor),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${data.current.tempC.round().toString()}°\n',
                                          style: const TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: data.current.condition.text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    style: const TextStyle(
                                        color: AppColors.kSecondaryColor),
                                    maxLines: null,
                                    TextSpan(
                                      children: [
                                        const TextSpan(text: 'Wind speed '),
                                        TextSpan(
                                          text:
                                              '${data.current.windKph.round().toString()}km/h ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: data.current.windDir),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeatherDetails(
                            variable: 'Precipitation: ',
                            value: '${data.current.precipMm.round()}',
                            icon: 'assets/images/lightrainshower.png',
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Humidity: ',
                            value: '${data.current.humidity.round()}%',
                            icon: 'assets/images/lightrain.png',
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Sunrise: ',
                            value: data.forecast.forecastday[0].astro.sunrise,
                            icon: 'assets/images/clear.png',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeatherDetails(
                            variable: 'Wind: ',
                            value: '${data.current.windKph.round()}km/h',
                            icon: 'assets/images/windspeed.png',
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Pressure: ',
                            value: '${data.current.pressureMb.round()}Mb',
                            icon: 'assets/images/heavycloud.png',
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Sunset: ',
                            value: data.forecast.forecastday[0].astro.sunset,
                            icon: 'assets/images/moon.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: forecastHours.length < 7 ? itemCount : 7,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedHourForecast = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kSecondaryColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                              border: selectedHourForecast == index
                                  ? Border.all(color: Colors.white)
                                  : const Border(),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Column(
                              children: [
                                DefaultText(
                                  '${DateFormat.H().format(DateTime.parse(forecastHours[index].time))}:00',
                                  fontSize: 10,
                                ),
                                SizedBox(height: 10.h),
                                Image.asset(
                                  'assets/images/${forecastHours[index].condition.text.toLowerCase().replaceAll(' ', '')}.png',
                                  height: 20.h,
                                ),
                                SizedBox(height: 10.h),
                                DefaultText(
                                  '${forecastHours[index].tempC?.round()}°C',
                                  fontSize: 15.sp,
                                  bold: true,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
