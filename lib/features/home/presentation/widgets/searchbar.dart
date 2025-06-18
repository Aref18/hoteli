import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/widgets/sort_filter.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _searchController = TextEditingController();

  void _openSearchDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Search",
      barrierColor: Colors.grey.withOpacity(0.2),
      pageBuilder: (context, anim1, anim2) {
        final tempController =
            TextEditingController(text: _searchController.text);
        return GestureDetector(
          onTap: () {
            // زمانی که روی بلور کلیک شد، متن رو ذخیره کن و ببند
            _searchController.text = tempController.text;
            Navigator.of(context).pop();
            setState(() {}); // تا UI آپدیت شه
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {}, // جلوگیری از بستن وقتی روی خود باکس کلیک شد
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SortFilter(),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.outline,
                              width: 20,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: tempController,
                              autofocus: true,
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                hintText: "جستجو در بین هتل‌ها...",
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 12),
                              ),
                              onSubmitted: (value) {
                                _searchController.text = value;
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _searchController.text = tempController.text;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),

                          // آیکون حذف شد چون فقط با کلیک بیرونی قراره بسته شه
                        ],
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
            SizedBox(
              height: 30,
              child: VerticalDivider(
                color: theme.colorScheme.outline,
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
