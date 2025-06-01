import 'package:flutter/material.dart';
import 'package:hoteli/features/onboarding/data/repositories/onboarding_repositories.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingRepositories repositories;

  OnboardingProvider(this.repositories) {
    _loadDate();
  }
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [];

  void _loadDate() {
    onboardingData = repositories.onboardingdata;
    notifyListeners();
  }

  void UpdateCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
