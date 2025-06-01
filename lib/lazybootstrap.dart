Future<void> lazybootstrap() async {}
/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoteli/core/theme/app_theme.dart';
import 'package:hoteli/core/theme/theme_provider.dart';
import 'package:hoteli/features/onboarding/data/repositories/onboarding_repositories.dart';
import 'package:hoteli/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hoteli/lazybootstrap.dart';
import 'package:hoteli/routes/app_routs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  // اجرای lazybootstrap (که می‌تونه خالی باشه)
  await lazybootstrap();

  // اجرای اپلیکیشن بعد از حذف اسپلش
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepositories()),
        ),
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

    // حذف اسپلش بعد از 100 میلی‌ثانیه
    Future.delayed(const Duration(milliseconds: 100), () {
      FlutterNativeSplash.remove();
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false)
        .UpdateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Hoteli',
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
}*/
