import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/homePageData.dart';

class AppConstans {
  static const String baseUrlImage =
      "https://dunijet.ir/content/projects/hotelino/";
  static const String hotelsdata = "assets/data/hotels.json";
}

class AppColor {
  static const Color primary = Color(0xFFB27258);

//Light Theme colors
  static const Color lightText = Colors.black;
  static const Color lighHit = Colors.grey;
  static const Color lighBorder = Color.fromARGB(255, 101, 101, 101);
  static const Color lighInput = Color.fromARGB(255, 239, 237, 237);
  static const Color lighFocuesborder = Colors.brown;

//Dark Theme colors
  static const Color DarkText = Colors.white;
  static const Color DarkHit = Colors.grey;
  static const Color DarkBorder = Color.fromARGB(255, 21, 21, 21);
  static const Color DarkInput = Color.fromARGB(255, 239, 237, 237);
  static const Color DarkFocuesborder = Colors.brown;
  static const Color DarkButton = Color.fromARGB(255, 80, 46, 33);
}

class HomePageDataConstants {
  static const List<String> _favoriteHotelIds = ["1", "3", "5", "7"];
  static const List<String> _discountedHotelIds = ["2", "4", "6", "8"];
  static const List<String> _recentlyViewedHotelIds = ["1", "4", "9"];
  static const List<String> _popularHotelIds = ["3", "6", "9", "10"];
  static const List<String> _specialOfferHotelIds = ["5", "7", "10"];
  static const List<String> _newestHotelIds = ["8", "9", "10"];

  static HomePageData get homePageData => HomePageData(
        Favarote: _favoriteHotelIds,
        discounted: _discountedHotelIds,
        RecentlyViewed: _recentlyViewedHotelIds,
        popular: _popularHotelIds,
        SpecialOffer: _specialOfferHotelIds,
        Newest: _newestHotelIds,
      );
}
