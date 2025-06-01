import 'package:flutter/material.dart';
import 'package:hoteli/features/favarotes/presentation/widgets/favarote_item.dart';
import 'package:hoteli/features/home/presentation/provider/profile_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/favarote_item_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_list_sections.dart';
import 'package:hoteli/features/home/presentation/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'هتل های مورد علاقه',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const Searchbar(),
            const SizedBox(height: 16),
            Consumer<FavaroteItemProvider>(
              builder: (context, favoriteProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favoriteProvider.favoriteHotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: FavoriteHotelCard(
                        hotel: favoriteProvider.favoriteHotelList[index],
                        onRemoveFavotiteClicked: (hotelId) {
                          favoriteProvider.toggleHotels(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if (profileProvider.recentlyViewedHotels.isNotEmpty) {
                  return HotelListSections(
                      title: "بازدید های اخیر",
                      hotels: profileProvider.recentlyViewedHotels);
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
