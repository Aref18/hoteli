import 'package:flutter/material.dart';
import 'package:hoteli/core/constants/constans.dart';

class ProfileOptionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  ProfileOptionItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 14,
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 239, 212, 148)),
                child: Icon(
                  icon,
                  size: 20,
                  color: AppColor.DarkFocuesborder,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
