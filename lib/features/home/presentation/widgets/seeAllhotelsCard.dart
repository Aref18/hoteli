import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_card_vertical.dart';

class Seeallhotelscard extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;

  const Seeallhotelscard(
      {super.key, required this.hotels, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HotelCardVertical(
                hotel: hotels[index], title: title, hotels: hotels),
          );
        },
      ),
    );
  }
}
