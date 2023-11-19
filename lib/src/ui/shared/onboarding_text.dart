import 'package:entangled/src/constants.dart';
import 'package:entangled/src/models/models.dart';
import 'package:entangled/src/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<OnboardingProvider>(context, listen: false).page;
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.elliptical(400, 300),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 85.w,
            height: 85.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: (page + 1) / OnboardingModel.onboarding.length,
                  strokeWidth: 4.h,
                  color: Colors.pinkAccent,
                ),
                Center(
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPrimaryColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        size: 30.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
