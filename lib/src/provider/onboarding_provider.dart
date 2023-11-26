import 'package:flutter/cupertino.dart';

class OnboardingProvider extends ChangeNotifier {
  int _page = 0;
  //bool _hasOnboarded
  int get page {
    return _page;
  }

  void goToPageIndex(page) {
    _page = page;
    notifyListeners();
  }

  void goToNextPage() {
    _page += 1;
    notifyListeners();
  }
}
