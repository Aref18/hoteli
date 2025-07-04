import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';

class FavaroteItemProvider extends ChangeNotifier {
  final HotelRepositories _hotelRepositories;
  FavaroteItemProvider(this._hotelRepositories) {
    fetchHotels();
  }

  final List<String> _favaroteHotelsId = [];
  List<Hotel> _hotels = [];

  /// گرفتن فقط هتل‌هایی که مورد علاقه هستند
  List<Hotel> get favoriteHotelList =>
      _hotels.where((hotel) => _favaroteHotelsId.contains(hotel.id)).toList();

  /// گرفتن لیست کامل هتل‌ها
  List<Hotel> get allHotels => _hotels;

  /// گرفتن داده هتل‌ها از رپازیتوری
  Future<void> fetchHotels() async {
    _hotels = await _hotelRepositories.fetchHotel();
    notifyListeners(); // بروزرسانی UI بعد از دریافت هتل‌ها
  }

  /// بررسی اینکه آیا یک هتل مورد علاقه است یا نه
  bool isFavarote(String hotelId) {
    return _favaroteHotelsId.contains(hotelId);
  }

  /// افزودن یا حذف کردن هتل از لیست مورد علاقه
  void toggleHotels(String hotelId) {
    if (_favaroteHotelsId.contains(hotelId)) {
      _favaroteHotelsId.remove(hotelId);
    } else {
      _favaroteHotelsId.add(hotelId);
    }
    notifyListeners(); // اینجا خیلی مهمه
  }
}
