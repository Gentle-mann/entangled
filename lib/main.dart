import 'package:entangled/src/constants.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/provider/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/ui/onboarding_screen.dart';

void main() {
  runApp(const Entangled());
}

class Entangled extends StatelessWidget {
  const Entangled({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => OnboardingProvider()),
              ChangeNotifierProvider(create: (context) => LocationProvider()),
            ],
            builder: (context, child) {
              return MaterialApp(
                theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppColors.kPrimaryColor,
                  primaryColor: AppColors.kPrimaryColor,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: AppColors.kPrimaryColor,
                    iconTheme: IconThemeData(color: AppColors.kSecondaryColor),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                builder: ((context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                }),
                home: const OnboardingScreen(),
              );
            });
      },
    );
  }
}
