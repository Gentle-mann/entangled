import 'package:entangled/src/constants.dart';
import 'package:entangled/src/models/models.dart';
import 'package:entangled/src/models/onboarding_model.dart';
import 'package:entangled/src/provider/app_state_manager.dart';
import 'package:entangled/src/provider/onboarding_provider.dart';
import 'package:entangled/src/size_configuration.dart';
import 'package:entangled/src/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().initialize;
    PageController pageController = PageController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              pageController.jumpToPage(2);
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: AppColors.kSecondaryColor),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: Consumer<OnboardingProvider>(
          builder: (context, onboardingProvider, child) {
        return PageView.builder(
          controller: pageController,
          itemCount: OnboardingModel.onboarding.length,
          onPageChanged: (page) {
            onboardingProvider.goToPageIndex(page);
            pageController.jumpToPage(onboardingProvider.page);
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                OnboardingImage(image: OnboardingModel.onboarding[index].image),
                Consumer<CacheProvider>(
                    builder: (context, appCacheManager, child) {
                  return OnboardingText(
                    title: OnboardingModel.onboarding[index].title,
                    subtitle: OnboardingModel.onboarding[index].subtitle,
                    onTap: () async {
                      if (pageController.page! + 1 <
                          OnboardingModel.onboarding.length) {
                        onboardingProvider.goToNextPage();
                        pageController.jumpToPage(onboardingProvider.page);
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }),
                        );
                        await appCacheManager.onboard();
                      }
                    },
                  );
                }),
              ],
            );
          },
        );
      }),
    );
  }
}
