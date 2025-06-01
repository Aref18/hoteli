import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingModel {
  String fullname;
  String destination;
  String numbersOFguestes;
  String numbers;
  JalaliRange? CheckInOutRangeData;

  BookingModel({
    this.fullname = '',
    this.destination = '',
    this.numbers = '',
    this.numbersOFguestes = '',
    this.CheckInOutRangeData,
  });
}
