import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';

class FavaroteItemProvider extends ChangeNotifier {
  final HotelRepositories _hotelRepositories;
  FavaroteItemProvider(this._hotelRepositories) {
    fetchHotels();
  }
  final List<String> _favaroteHotelsId = [];
  List<Hotel> get favoriteHotelList =>
      _hotels.where((hotel) => _favaroteHotelsId.contains(hotel.id)).toList();
  List<Hotel> _hotels = [];

  fetchHotels() async {
    _hotels = await _hotelRepositories.fetchHotel();
    notifyListeners();
  }

  bool isFavarote(String hotel) {
    return _favaroteHotelsId.contains(hotel);
  }

  void toggleHotels(String hotel) {
    if (_favaroteHotelsId.contains(hotel)) {
      _favaroteHotelsId.remove(hotel);
    } else {
      (_favaroteHotelsId.add(hotel));
    }
  }

  notifyListeners();
}
