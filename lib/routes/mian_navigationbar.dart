import 'package:flutter/material.dart';
import 'package:hoteli/core/constants/constans.dart';
import 'package:hoteli/features/booking/presentation/booking_page.dart';
import 'package:hoteli/features/booking/presentation/widgets/terms_widget.dart';
import 'package:hoteli/features/favarotes/presentation/favarote_page.dart';
import 'package:hoteli/features/home/presentation/homeScreen.dart';
import 'package:hoteli/features/profile/presentation/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MianNavigationbar extends StatefulWidget {
  const MianNavigationbar({super.key});

  @override
  State<MianNavigationbar> createState() => _MianNavigationbarState();
}

class _MianNavigationbarState extends State<MianNavigationbar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  _builscreens() {
    return [
      const homeScreen(),
      const FavoritePage(),
      BookingPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _NavbarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "خانه",
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: "علاقه‌مندی‌ها",
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book_online),
        title: "رزرو",
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "پروفایل",
        activeColorPrimary: AppColor.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      onItemSelected: (index) {
        if (index != 2) {
          BookingPage.bookingPageKey.currentState?.resetForm();
          TermsWidget.termsKey.currentState?.resetCheckbox();
        }
      },
      context,
      controller: _controller,
      screens: _builscreens(),
      items: _NavbarItem(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      navBarStyle: NavBarStyle.style9,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      handleAndroidBackButtonPress: true,
      confineToSafeArea: true,
      animationSettings: NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 200), curve: Curves.ease),
      ),
    );
  }
}
