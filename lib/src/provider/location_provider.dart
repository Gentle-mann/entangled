import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class LocationProvider extends ChangeNotifier {
  String _state = NigerianStatesAndLGA.allStates[36];
  String _lga =
      NigerianStatesAndLGA.getStateLGAs(NigerianStatesAndLGA.allStates[36])[0];
  String get state {
    return _state;
  }

  String get lga {
    return _lga;
  }

  void setNigerianState(String newCity) {
    _state = newCity;
    notifyListeners();
  }

  void setLga(String newLga) {
    _lga = newLga;
    notifyListeners();
  }
}
