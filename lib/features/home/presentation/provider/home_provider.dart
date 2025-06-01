import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoteli/core/constants/constans.dart';
import 'package:hoteli/features/home/data/models/homePageData.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepositories _hotelRepositories;

  HomeProvider(this._hotelRepositories) {
    fetchHotel();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;
  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;
  fetchHotel() async {
    _hotels = await _hotelRepositories.fetchHotel();
    notifyListeners();
  }

  // filter----------------------------------------------

  List<Hotel> GetPopluarHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.popular.contains(hotel.id),
        )
        .toList();
  }

  List<Hotel> GetSpeciaSpecialOfferHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.SpecialOffer.contains(hotel.id),
        )
        .toList();
  }

  List<Hotel> GetNewestHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.Newest.contains(hotel.id),
        )
        .toList();
  }

  //story sec----------------------

  List<String> GetStoryImages() {
    final ShuffleImages = List<Hotel>.from(_hotels)..shuffle();
    return ShuffleImages.take(3)
        .map(
          (hotel) => hotel.images[0],
        )
        .toList();
  }

  final List<String> _StoryText = [
    "امکانات کامل رفاهی",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها",
  ];
  List<String> get storytext => _StoryText;
}
