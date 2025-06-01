import 'package:flutter/material.dart';
import 'package:hoteli/core/theme/app_theme.dart';
import 'package:hoteli/core/theme/theme_provider.dart';
import 'package:hoteli/features/booking/presentation/booking_provider.dart';
import 'package:hoteli/features/home/data/repositories/hotel_repositories.dart';
import 'package:hoteli/features/home/data/repositories/profile_repositories.dart';
import 'package:hoteli/features/home/presentation/provider/home_provider.dart';
import 'package:hoteli/features/home/presentation/provider/profile_provider.dart';
import 'package:hoteli/features/home/presentation/widgets/favarote_item_provider.dart';
import 'package:hoteli/features/onboarding/data/repositories/onboarding_repositories.dart';
import 'package:hoteli/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hoteli/lazybootstrap.dart';
import 'package:hoteli/routes/app_routs.dart';
import 'package:hoteli/shared/services/jason_data_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await lazybootstrap();
  FlutterNativeSplash.remove();
  final hotelRepositories =
      HotelRepositories(jsonDataService: JasonDataService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(
            OnboardingRepositories(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(hotelRepositories),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(
            hotelRepositories,
            ProfileRepositories(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => FavaroteItemProvider(hotelRepositories),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingProvider(),
        )
      ],
      child: const Hoteli(),
    ),
  );
}

class Hoteli extends StatefulWidget {
  const Hoteli({super.key});

  @override
  State<Hoteli> createState() => _HoteliState();
}

class _HoteliState extends State<Hoteli> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      FlutterNativeSplash.remove();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of(context, listen: false).UpdateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Hoteli',
          locale: const Locale("fa", "IR"),
          supportedLocales: const [
            Locale("fa", "IR"),
            Locale("en", "US"),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
          ],
          routes: AppRouts.routs,
          initialRoute: AppRouts.onboarding,
          debugShowCheckedModeBanner: false,
          theme: AppThemeLight.LightTheme,
          darkTheme: AppThemeDark.DarkTheme,
          themeMode: themeProvider.brightness == Brightness.light
              ? ThemeMode.light
              : ThemeMode.dark,
        );
      },
    );
  }
}
