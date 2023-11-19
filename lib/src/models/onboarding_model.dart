class OnboardingModel {
  final String title, subtitle, image;

  OnboardingModel(
      {required this.subtitle, required this.title, required this.image});
  static final onboarding = [
    OnboardingModel(
      title: 'Detailed Hourly Forecast',
      image: 'assets/images/showers.png',
      subtitle: 'Get in-depth weather information',
    ),
    OnboardingModel(
      title: 'Live Weather Updates',
      image: 'assets/images/clear.png',
      subtitle: 'Stay informed in real-time',
    ),
    OnboardingModel(
      title: 'Global Access',
      image: 'assets/images/climatization.png',
      subtitle: 'Get updates from all over the Globe',
    ),
  ];
}
