import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hoteli/core/utils/network.dart';
import 'package:hoteli/features/details/presentation/hotel_detail_page.dart';
import 'package:hoteli/features/home/presentation/provider/home_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/sort_filter.dart';
import 'package:provider/provider.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dialogSearchController = TextEditingController();

  void _openSearchDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Search",
      barrierColor: Colors.transparent,
      pageBuilder: (context, anim1, anim2) {
        _dialogSearchController.text = _searchController.text;

        return GestureDetector(
          onTap: () {
            _searchController.text = _dialogSearchController.text;
            Navigator.of(context).pop();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SortFilter(),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller: _dialogSearchController,
                                      autofocus: true,
                                      onChanged: (value) {
                                        setState(() {}); // ✅ آپدیت لیست زنده
                                      },
                                      textDirection: TextDirection.rtl,
                                      decoration: const InputDecoration(
                                        hintText: "جستجو در بین هتل‌ها...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _searchController.text =
                                          _dialogSearchController.text;
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.search,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Expanded(
                                child: Consumer<HomeProvider>(
                                  builder: (context, homeProvider, _) {
                                    final query = _dialogSearchController.text
                                        .trim()
                                        .toLowerCase();

                                    if (query.isEmpty) {
                                      return const Center(
                                          child: Text("نام هتل را جستجو کنید"));
                                    }

                                    final matchedHotels = homeProvider.hotels
                                        .where((hotel) => hotel.name
                                            .toLowerCase()
                                            .contains(query))
                                        .toList();

                                    if (matchedHotels.isEmpty) {
                                      return const Center(
                                          child: Text("هتلی یافت نشد"));
                                    }

                                    return ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                      itemCount: matchedHotels.length,
                                      itemBuilder: (context, index) {
                                        final hotel = matchedHotels[index];
                                        return ListTile(
                                          leading: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                networkUrl(hotel.images[0]),
                                                width: 100,
                                                height: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            hotel.name,
                                            textAlign: TextAlign.end,
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => HotelDetailPage(
                                                  hotelId: hotel.id,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SortFilter(),
            const SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.grey,
                width: 20,
                thickness: 1,
              ),
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                readOnly: true,
                onTap: _openSearchDialog,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "جستجو در بین هتل ها",
                  hintTextDirection: TextDirection.rtl,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            IconButton(
              onPressed: _openSearchDialog,
              icon: Icon(
                Icons.search,
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
