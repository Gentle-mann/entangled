import 'package:entangled/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Saturday, 20 November',
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
        ],
      ),
    );
  }
}
