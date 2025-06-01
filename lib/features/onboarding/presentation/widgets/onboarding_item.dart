import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final String title;
  final String describtion;
  final String image;

  const OnboardingItem(
      {super.key,
      required this.title,
      required this.describtion,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 350,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
        Text(
          describtion,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
