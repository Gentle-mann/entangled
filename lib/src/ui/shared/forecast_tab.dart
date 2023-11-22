import 'package:entangled/src/constants.dart';
import 'package:entangled/src/ui/shared/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForecastTab extends StatelessWidget {
  const ForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.h,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  7,
                  (index) => Column(
                    children: [
                      Image.asset(
                        index % 2 == 1
                            ? 'assets/images/clear.png'
                            : 'assets/images/heavycloud.png',
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultText(
                        days[index],
                        fontSize: 10,
                      ),
                      const SizedBox(height: 10),
                      DefaultText(
                        '${index + 33}°',
                        bold: true,
                        fontSize: 15,
                      ),
                    ],
                  ),
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
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kSecondaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              DefaultText(
                                days[index],
                                fontSize: 12,
                              ),
                              DefaultText(
                                'NOV ${index + 20},',
                                fontSize: 15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/showers.png',
                                height: 30,
                              ),
                              const Column(
                                children: [
                                  DefaultText(
                                    'Thunderstorms',
                                    fontSize: 15,
                                  ),
                                  DefaultText(
                                    'ssw 11 km/h',
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              DefaultText(
                                '33°/28°',
                                bold: true,
                                fontSize: 15,
                              ),
                              DefaultText(
                                '30%',
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
  }
}
