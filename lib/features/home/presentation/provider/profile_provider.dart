import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/models/profile.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';
import 'package:hoteli/features/home/data/repositories/profile_repositories.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepositories _profileRepositories;
  final HotelRepositories _hotelRepositories;
  Profile? _profile;
  Profile? get ProFile => _profile;

  List<Hotel> _hotel = [];
  final List<String> recentluviewedhotels = [];

  ProfileProvider(this._hotelRepositories, this._profileRepositories) {
    loaduserprofile();
    fetchhotels();
  }
  loaduserprofile() async {
    _profile = await _profileRepositories.fetchuserprofile();
    notifyListeners();
  }

  fetchhotels() async {
    _hotel = await _hotelRepositories.fetchHotel();
  }

  // recently viewed hotels

  final List<String> _recentlyViewedHotels = [];

  List<Hotel> get recentlyViewedHotels => _hotel
      .where((hotel) => _recentlyViewedHotels.contains(hotel.id))
      .toList();

  void addrecentyviewedhotel(String HotelId) {
    if (!recentlyViewedHotels.contains(HotelId)) {
      _recentlyViewedHotels.add(HotelId);
      notifyListeners();
    } else {
      _recentlyViewedHotels.remove(HotelId);
      _recentlyViewedHotels.add(HotelId);
      notifyListeners();
    }
  }
}
