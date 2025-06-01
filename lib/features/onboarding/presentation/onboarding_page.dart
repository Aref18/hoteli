import 'package:flutter/material.dart';
import 'package:hoteli/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hoteli/features/onboarding/presentation/widgets/onboarding_fab.dart';
import 'package:hoteli/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:hoteli/routes/app_routs.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final onboardingData = onboardingProvider.onboardingData;
    int totalPage = onboardingData.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPage,
              onPageChanged: onboardingProvider.UpdateCurrentPage,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnboardingItem(
                  title: data["Title"]!,
                  describtion: data["describtion"]!,
                  image: data["Image"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          buildPageIndicator(
              onboardingProvider.currentPage, totalPage, context),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingFab(
                  key: const ValueKey('back'),
                  visible: onboardingProvider.currentPage > 0,
                  icon: Icons.arrow_back,
                  Onpressd: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  backgroundColor: Colors.transparent,
                  iconColor: Theme.of(context).colorScheme.primary,
                ),
                OnboardingFab(
                  visible: onboardingProvider.currentPage < totalPage - 1,
                  icon: Icons.arrow_forward,
                  Onpressd: () {
                    if (onboardingProvider.currentPage <
                        onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (onboardingProvider.currentPage == totalPage - 1)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1,
                  child: child,
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRouts.home);
                    },
                    child: const Center(
                      child: Text(
                        'شروع رزرو هتل',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sahel',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget buildPageIndicator(
    int currentIndex, int totalPage, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      totalPage,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: currentIndex == index ? 12 : 8,
        height: currentIndex == index ? 12 : 8,
        decoration: BoxDecoration(
          color: currentIndex == index
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withAlpha(index),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
