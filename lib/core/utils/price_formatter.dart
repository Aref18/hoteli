import 'package:intl/intl.dart';

String FormaterPrice(int Price) {
  final formatter = NumberFormat.decimalPattern('fa');
  return formatter.format(Price);
}
