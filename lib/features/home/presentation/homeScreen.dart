import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/provider/home_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/ad_banner.dart';
import 'package:hoteli/features/home/presentation/widgets/home_appbar.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_list_sections.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:hoteli/features/home/presentation/widgets/searchbar.dart';
import 'package:hoteli/features/home/presentation/widgets/story_carousel.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 16,
            ),
            Searchbar(),
            SizedBox(
              height: 32,
            ),
            AdBanner(),
            SizedBox(
              height: 16,
            ),
            Consumer<HomeProvider>(
              builder: (context, HomeProvider, child) {
                return HotelListSections(
                  title: "پیشنهاد امروز",
                  hotels: HomeProvider.GetPopluarHotels(),
                  onseeAllPressed: () {},
                );
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, HomeProvider, child) {
                return HotelListSections(
                  title: "مجبوب ترین هتل ها",
                  hotels: HomeProvider.GetSpeciaSpecialOfferHotels(),
                  onseeAllPressed: () {},
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                    images: homeProvider.GetStoryImages(),
                    titles: homeProvider.storytext);
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                    title: "جدیدترین هتل‌ها",
                    hotels: homeProvider.GetNewestHotels());
              },
            ),
          ],
        ),
      ),
    );
  }
}
