import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hoteli/core/utils/network.dart';
import 'package:hoteli/features/details/presentation/fullscreen_map.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';
import 'package:hoteli/shared/services/jason_data_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hotelRepositories =
        HotelRepositories(jsonDataService: JasonDataService());
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
                ),
                elevation: 8,
                expandedHeight: 300,
                leading: IconButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotel.name,
                        style: textTheme.headlineMedium,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            hotel.address,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "امکانات رفاهی",
                        style: textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        spacing: 14,
                        children: hotel.amenities.map<Widget>((a) {
                          IconData icon;
                          switch (a) {
                            case 'ساحل':
                              icon = Icons.beach_access;
                              break;
                            case 'کافه':
                              icon = Icons.coffee_sharp;
                              break;
                            case 'رستوران':
                              icon = Icons.restaurant_menu;
                              break;
                            case 'استخر':
                              icon = Icons.pool;
                              break;
                            case 'باشگاه':
                              icon = Icons.sports_gymnastics;
                              break;
                            case 'کولر':
                              icon = Icons.ac_unit;
                              break;
                            default:
                              icon = Icons.circle;
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(icon, size: 30, color: Colors.grey),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                a,
                                style: textTheme.bodySmall!
                                    .copyWith(color: Colors.black87),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          );
                        }).toList(), // <- تبدیل به لیست
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'گالری تصاویر ',
                        style: textTheme.displaySmall,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: hotel.images.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    networkUrl(
                                      hotel.images[index],
                                    ),
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 200,
                                  ),
                                ),
                                if (index != 0)
                                  const SizedBox(
                                    width: 8,
                                  )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'توضیحات ',
                        style: textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        hotel.description,
                        style: textTheme.bodyLarge!.copyWith(height: 1.5),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "موقعیت مکانیه هتل روی نقشه",
                            style: textTheme.headlineMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: FullscreenMap(
                                      latitude: hotel.location.latitude,
                                      longitude: hotel.location.longitude,
                                      hotelName: hotel.name),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino);
                            },
                            child: const Text(
                              "تمام صفحه ",
                              style: TextStyle(color: Colors.red, fontSize: 19),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: FlutterMap(
                            options: MapOptions(
                              initialZoom: 15,
                              interactionOptions: const InteractionOptions(
                                  flags: InteractiveFlag.all &
                                      ~InteractiveFlag.rotate),
                              initialCenter: LatLng(hotel.location.latitude,
                                  hotel.location.longitude),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.v.hoteli',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(hotel.location.latitude,
                                        hotel.location.longitude),
                                    width: 80,
                                    height: 80,
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 2),
                                          color: Colors.white.withOpacity(0.8),
                                          child: Text(
                                            hotel.name,
                                            textDirection: TextDirection.rtl,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: textTheme.bodySmall!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
