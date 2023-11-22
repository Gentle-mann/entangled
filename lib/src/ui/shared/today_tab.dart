import 'package:entangled/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

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
            child: const DefaultText(
              'Sunday, 19 November',
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            //height: 130.h,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/heavycloud.png',
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(color: AppColors.kSecondaryColor),
                          children: [
                            TextSpan(text: '16°/20° '),
                            TextSpan(
                                text: '| ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                                text: 'Feels like ',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                            TextSpan(
                              text: '25°C',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text.rich(
                            style: TextStyle(color: AppColors.kSecondaryColor),
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '18°\n',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'Heavy Cloud'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            style: TextStyle(color: AppColors.kSecondaryColor),
                            maxLines: null,
                            TextSpan(
                              children: [
                                TextSpan(text: 'Wind speed '),
                                TextSpan(
                                  text: '9km/h ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'WSW'),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherDetails(
                    variable: 'Precipitation: ',
                    value: '21%',
                  ),
                  SizedBox(height: 10),
                  WeatherDetails(
                    variable: 'Humidity: ',
                    value: '59%',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherDetails(
                    variable: 'Wind: ',
                    value: '10km/h',
                  ),
                  SizedBox(height: 10),
                  WeatherDetails(
                    variable: 'Sunset: ',
                    value: '29%',
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
}
