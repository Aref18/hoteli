import 'package:flutter/material.dart';

class SortFilter extends StatelessWidget {
  SortFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.tune),
      tooltip: 'مرتب‌سازی',
      onSelected: (value) {},
      position: PopupMenuPosition.under,
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'جدیدترین', child: Text('جدیدترین')),
        const PopupMenuItem(value: 'محبوب‌ترین', child: Text('محبوب‌ترین')),
        const PopupMenuItem(value: 'کمترین قیمت', child: Text('کمترین قیمت')),
        const PopupMenuItem(
            value: 'بیشترین امتیاز', child: Text('بیشترین امتیاز')),
      ],
    );
  }
}
