import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/provider/home_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/ad_banner.dart';
import 'package:hoteli/features/home/presentation/widgets/home_appbar.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_list_sections.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_vertical_list.dart';
import 'package:hoteli/features/home/presentation/widgets/searchbar.dart';
import 'package:hoteli/features/home/presentation/widgets/story_carousel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Use SliverAppBar with your custom AppBar widget
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 80.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: HomeAppbar(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(child: Searchbar()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),

          SliverToBoxAdapter(child: AdBanner()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSections(
                  title: "پیشنهاد امروز",
                  hotels: homeProvider.GetPopluarHotels(),
                  onseeAllPressed: () {},
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSections(
                  title: "مجبوب ترین هتل ها",
                  hotels: homeProvider.GetSpeciaSpecialOfferHotels(),
                  onseeAllPressed: () {},
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return StoryCarousel(
                  images: homeProvider.GetStoryImages(),
                  titles: homeProvider.storytext,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelVerticalList(
                  title: "جدیدترین هتل‌ها",
                  hotels: homeProvider.GetNewestHotels(),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
