import 'package:entangled/src/constants.dart';
import 'package:entangled/src/provider/app_state_manager.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/provider/onboarding_provider.dart';
import 'package:entangled/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/ui/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cacheProvider = CacheProvider();
  final locationProvider = LocationProvider();

  await cacheProvider.initialize();
  await locationProvider.initializeLocation();

  runApp(Entangled(
    cacheProvider: cacheProvider,
    locationProvider: locationProvider,
  ));
}

class Entangled extends StatefulWidget {
  const Entangled(
      {super.key, required this.cacheProvider, required this.locationProvider});
  final CacheProvider cacheProvider;
  final LocationProvider locationProvider;

  @override
  State<Entangled> createState() => _EntangledState();
}

class _EntangledState extends State<Entangled> {
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
              ChangeNotifierProvider(
                  create: (context) => widget.locationProvider),
              ChangeNotifierProvider(create: (context) => widget.cacheProvider),
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
                home: widget.cacheProvider.hasOnboarded
                    ? const HomeScreen()
                    : const OnboardingScreen(),
              );
            });
      },
    );
  }
}
