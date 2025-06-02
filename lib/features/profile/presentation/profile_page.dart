import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/provider/profile_provider.dart';
import 'package:hoteli/features/profile/presentation/widgets/profile_option_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  Future<void> _pickimage() async {
    final Picker = ImagePicker();
    final Picked = await Picker.pickImage(source: ImageSource.gallery);
    if (Picked != null) {
      setState(() {
        _image = File(Picked.path);
      });
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textDirection: TextDirection.rtl,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, ProfileProvider, child) {
        final profile = ProfileProvider.ProFile;
        if (profile == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : profile.imageUrl.startsWith('assets/')
                                ? AssetImage(profile.imageUrl) as ImageProvider
                                : NetworkImage(profile.imageUrl),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: _pickimage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.white,
                              weight: 200,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Arefmoosavi7813@gmail.com',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 40,
                  ),
                  ProfileOptionItem(
                    title: "اطلاعات صفحه کاربری",
                    icon: Icons.person_outline,
                    onTap: () =>
                        _showSnackbar(context, "مشاهده اطلاعات صفحه کاربری"),
                  ),
                  ProfileOptionItem(
                    title: "اعلان ها",
                    icon: Icons.notifications_outlined,
                    onTap: () => _showSnackbar(context, "مشاهده اعلان‌ها"),
                  ),
                  ProfileOptionItem(
                    title: "لیست مورد علاقه ها",
                    icon: Icons.favorite_outline,
                    onTap: () =>
                        _showSnackbar(context, "مشاهده لیست علاقه‌مندی‌ها"),
                  ),
                  ProfileOptionItem(
                    title: "فراموشی رمز عبور",
                    icon: Icons.key_outlined,
                    onTap: () =>
                        _showSnackbar(context, "تغییر یا بازیابی رمز عبور"),
                  ),
                  ProfileOptionItem(
                    title: "روش های پرداخت",
                    icon: Icons.credit_card_outlined,
                    onTap: () =>
                        _showSnackbar(context, "مشاهده روش‌های پرداخت"),
                  ),
                  ProfileOptionItem(
                    title: "تنظیمات",
                    icon: Icons.settings_outlined,
                    onTap: () =>
                        _showSnackbar(context, "تنظیمات پروفایل کاربری"),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
