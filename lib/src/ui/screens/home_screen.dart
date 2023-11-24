import 'package:entangled/src/constants.dart';
import 'package:entangled/src/provider/location_provider.dart';
import 'package:entangled/src/ui/shared/Forecast_tab.dart';
import 'package:entangled/src/ui/shared/default_text.dart';
import 'package:entangled/src/ui/shared/drawer.dart';
import 'package:entangled/src/ui/shared/today_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        final isState = locationProvider.state == 'FCT(Abuja)' ? '' : 'State';
        return Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            title: DefaultText(
                '${locationProvider.lga}, ${locationProvider.state} $isState'),
            centerTitle: true,
            elevation: 0,
            bottom: const TabBar(
              labelColor: AppColors.kSecondaryColor,
              indicatorColor: AppColors.kSecondaryColor,
              dividerColor: AppColors.kSecondaryColor,
              tabs: [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Forecast',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TodayTab(),
              ForecastTab(),
            ],
          ),
        );
      }),
    );
  }
}
