import 'package:entangled/src/cache/app_cache.dart';
import 'package:flutter/cupertino.dart';

class CacheProvider extends ChangeNotifier {
  bool _hasOnboarded = false;

  final _appCache = AppCache();
  bool get hasOnboarded {
    return _hasOnboarded;
  }

  Future<void> initialize() async {
    _hasOnboarded = await _appCache.didUserCompleteOnboarding();
  }

  Future<void> onboard() async {
    _hasOnboarded = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }
}
