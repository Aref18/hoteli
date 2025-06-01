import 'package:flutter/material.dart';
import 'package:hoteli/features/booking/data/models/booking_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider extends ChangeNotifier {
  final BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;
  void setName(String value) {
    _booking.fullname = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _booking.destination = value;
    notifyListeners();
  }

  void setNumbersOFguestes(String value) {
    _booking.numbersOFguestes = value;
    notifyListeners();
  }

  void setPhoneNumbers(String value) {
    _booking.numbers = value;
    notifyListeners();
  }

  void setRageData(JalaliRange value) {
    _booking.CheckInOutRangeData = value;
    notifyListeners();
  }
}
