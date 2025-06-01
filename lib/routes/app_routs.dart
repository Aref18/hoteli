import 'package:flutter/material.dart';
import 'package:hoteli/features/onboarding/presentation/onboarding_page.dart';
import 'package:hoteli/routes/mian_navigationbar.dart';

class AppRouts {
  static const String home = '/';
  static const String hoteldetail = '/hoteldetail';
  static const String bookingform = '/bookingform';
  static const String favorite = '/favorite';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';
  static final Map<String, WidgetBuilder> routs = {
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const MianNavigationbar()
  };
}
