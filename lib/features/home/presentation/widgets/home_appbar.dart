import 'package:flutter/material.dart';
import 'package:hoteli/core/theme/theme_provider.dart';
import 'package:hoteli/features/home/presentation/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.grey,
                    ),
                  ),
                  Consumer<ProfileProvider>(
                    builder: (context, ProfileProvider, child) {
                      return ProfileProvider.ProFile?.notifications != null &&
                              ProfileProvider.ProFile!.notifications > 0
                          ? Positioned(
                              right: 14,
                              top: 15,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ))
                          : const SizedBox();
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  themeProvider.changeTheme();
                },
                icon: Icon(themeProvider.brightness == Brightness.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                color: Colors.grey,
              ),
            ],
          ),
          Consumer<ProfileProvider>(
            builder: (context, ProfileProvider, child) {
              return Row(
                children: [
                  Text(
                    ProfileProvider.ProFile?.name ?? "کاربر",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/v4.png"),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
