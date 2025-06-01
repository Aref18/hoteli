import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  ThemeProvider(this._brightness);
  Brightness get brightness => _brightness;

  void changeTheme() {
    _brightness =
        (_brightness == Brightness.dark) ? Brightness.light : Brightness.dark;
    notifyListeners();
  }

  void UpdateBrightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }
}
