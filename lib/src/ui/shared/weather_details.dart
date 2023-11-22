import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    super.key,
    required this.variable,
    required this.value,
  });
  final String variable;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/images/heavycloud.png',
            height: 14.h,
          ),
          const SizedBox(
            width: 15,
          ),
          DefaultText(
            variable,
            fontSize: 12,
          ),
          DefaultText(
            value,
            fontSize: 13,
            bold: true,
          ),
        ],
      ),
    );
  }
}
