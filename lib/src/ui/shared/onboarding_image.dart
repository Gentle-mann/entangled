import 'package:entangled/src/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0XFF03002E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          Image.asset(
            image,
            width: 200,
          ),
          SizedBox(height: 80.h),
          SizedBox(
            height: 10.h,
            width: 46.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: OnboardingModel.onboarding.length,
              itemBuilder: (BuildContext context, int index) {
                final currentPage =
                    Provider.of<OnboardingProvider>(context, listen: false)
                        .page;
                return Container(
                  margin: EdgeInsets.only(right: 5.h),
                  width: index == currentPage ? 20 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.h),
                    color: index == currentPage
                        ? const Color(0XFF698ae8)
                        : Colors.white,
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
