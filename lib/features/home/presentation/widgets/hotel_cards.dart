import 'package:flutter/material.dart';
import 'package:hoteli/core/utils/network.dart';
import 'package:hoteli/core/utils/price_formatter.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/presentation/widgets/favarote_button.dart';
import 'package:hoteli/features/home/presentation/widgets/favarote_item_provider.dart';
import 'package:provider/provider.dart';

class HotelCards extends StatelessWidget {
  Hotel hotel;
  HotelCards({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favaroteItemProvider = Provider.of<FavaroteItemProvider>(context);
    final isfavorite = favaroteItemProvider.isFavarote(hotel.id);
    return SizedBox(
      width: 280,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    networkUrl(hotel.images[0]),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: AnimatedFavoriteButton(
                    isFavorite: isfavorite,
                    onTap: () {
                      favaroteItemProvider.toggleHotels(hotel.id);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${hotel.rating} (${FormaterPrice(hotel.reviewCount)})',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        hotel.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${hotel.city} , ${hotel.country}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "از ${FormaterPrice(hotel.pricePerNight)} / شب",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'مشاهده و انتخاب اتاق',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
