import 'package:entangled/src/cache/app_cache.dart';
import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class LocationProvider extends ChangeNotifier {
  String _state = '';
  //NigerianStatesAndLGA.allStates[36];
  String _lga = '';
  //NigerianStatesAndLGA.getStateLGAs(NigerianStatesAndLGA.allStates[36])[0];
  final _appCache = AppCache();
  String get state {
    return _state;
  }

  String get lga {
    return _lga;
  }

  void updateNigerianState(String newCity) {
    _state = newCity;
    notifyListeners();
  }

  void updateLga(String newLga) {
    _lga = newLga;
    notifyListeners();
  }

  Future<void> initializeLocation() async {
    _state = await _appCache.getNigerianState() ??
        NigerianStatesAndLGA.allStates[36];
    _lga = await _appCache.getLga() ??
        NigerianStatesAndLGA.getStateLGAs(
            NigerianStatesAndLGA.allStates[36])[0];
  }
}
