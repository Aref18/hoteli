import 'package:flutter/material.dart';
import 'package:hoteli/features/home/data/models/hotel.dart';
import 'package:hoteli/features/home/presentation/widgets/seeAllhotelsCard.dart';
import 'package:hoteli/features/home/presentation/widgets/hotel_cards.dart';

class HotelListSections extends StatelessWidget {
  const HotelListSections(
      {super.key,
      required this.title,
      required this.hotels,
      this.onseeAllPressed});
  final String title;
  final List<Hotel> hotels;
  final VoidCallback? onseeAllPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 19, right: 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Seeallhotelscard(hotels: hotels, title: title);
                    },
                  ));
                },
                child: Text(
                  "مشاهده همه",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 360,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 16),
            clipBehavior: Clip.none,
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16),
                child: HotelCards(hotel: hotels[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
