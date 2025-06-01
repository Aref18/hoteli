import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hoteli/core/constants/constans.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';

class JasonDataService {
  Future<List<Hotel>> loadHotels() async {
    final response = await rootBundle.loadString(AppConstans.hotelsdata);

    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> HotelsList = jsonData['hotels'];
    return HotelsList.map(
      (hotel) => Hotel.fromJson(hotel as Map<String, dynamic>),
    ).toList();
  }
}
