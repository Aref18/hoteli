import 'package:flutter/material.dart';
import 'package:hoteli/core/utils/network.dart';
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
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    child: Image.network(
                      fit: BoxFit.cover,
                      networkUrl(hotel.images.first),
                    ),
                    onLongPress: () {},
                  ),
                  title: Text(hotel.name),
                ),
                actions: const [],
              ),
            ],
          ),
        );
      },
    );
  }
}
