import 'package:entangled/src/constants.dart';
import 'package:entangled/src/ui/shared/Forecast_tab.dart';
import 'package:entangled/src/ui/shared/default_text.dart';
import 'package:entangled/src/ui/shared/today_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const Drawer(
          child: Column(
            children: [
              ListTile(
                title: Text('Location'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const DefaultText('Abuja, Nigeria'),
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
      ),
    );
  }
}
