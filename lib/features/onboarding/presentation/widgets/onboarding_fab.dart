import 'package:flutter/material.dart';

class OnboardingFab extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final VoidCallback Onpressd;
  final Color backgroundColor;
  final Color iconColor;

  const OnboardingFab(
      {super.key,
      required this.visible,
      required this.icon,
      required this.Onpressd,
      required this.backgroundColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: visible
          ? Container(
              child: FloatingActionButton(
                onPressed: Onpressd,
                elevation: 0,
                backgroundColor: backgroundColor,
                shape: CircleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
