import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarded', true);
  }

  Future<bool> didUserCompleteOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarded') ?? false;
  }

  Future<void> setNigerianState(String state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('state', state);
  }

  Future<String?> getNigerianState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('state');
  }

  Future<void> setLga(String lga) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lga', lga);
  }

  Future<String?> getLga() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lga');
  }
}
