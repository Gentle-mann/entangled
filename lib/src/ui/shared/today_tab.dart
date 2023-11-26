import 'package:entangled/src/constants.dart';
import 'package:entangled/src/models/models.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'shared.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({super.key});

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  late Future<WeatherModel> weatherDetails;
  @override
  void didChangeDependencies() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    weatherDetails = WeatherService().getWeather(
        '${locationProvider.lga} ${locationProvider.state} Nigeria');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/clear.png',
      'assets/images/heavycloud.png',
      'assets/images/heavyrain.png',
      'assets/images/showers.png',
      'assets/images/clear.png',
      'assets/images/heavyrain.png',
      'assets/images/thunderstorm.png',
      'assets/images/heavyrain.png',
      'assets/images/thunderstorm.png',
    ];
    return FutureBuilder(
        future: weatherDetails,
        builder: (context, snapshot) {
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
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Humidity: ',
                            value: '${data.current.humidity.round()}%',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WeatherDetails(
                            variable: 'Wind: ',
                            value: '${data.current.windKph.round()}km/h',
                          ),
                          const SizedBox(height: 10),
                          WeatherDetails(
                            variable: 'Pressure: ',
                            value: '${data.current.pressureMb.round()}Mb',
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.kSecondaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30),
                            border: index == 1
                                ? Border.all(color: Colors.white)
                                : const Border(),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Column(
                            children: [
                              const DefaultText(
                                '1:00',
                                fontSize: 10,
                              ),
                              SizedBox(height: 10.h),
                              Image.asset(
                                images[index],
                                height: 20.h,
                              ),
                              SizedBox(height: 10.h),
                              DefaultText(
                                '29%',
                                fontSize: 15.sp,
                                bold: true,
                              ),
                            ],
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
