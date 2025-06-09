import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';
import 'package:hoteli/shared/services/jason_data_service.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    final hotelRepositories =
        HotelRepositories(jsonDataService: JasonDataService());
    final TextTheme = Theme.of(context).textTheme;
    return FutureBuilder<Hotel>(
      future: hotelRepositories.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final hotel = snapshot.data!;
        return const Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                actions: [],
              ),
            ],
          ),
        );
      },
    );
  }
}
