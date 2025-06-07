import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/widgets/sort_filter.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
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
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
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
              onPressed: () {},
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
