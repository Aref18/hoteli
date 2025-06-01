import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoteli/features/home/presentation/provider/profile_provider.dart';
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
                  SizedBox(
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
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Icon(
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
                  SizedBox(
                    height: 20,
                  ),
                  Text('Arefmoosavi7813@gmail.com',
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
          )),
        );
      },
      child: Scaffold(
        body: Center(
          child: Text("profie"),
        ),
      ),
    );
  }
}
