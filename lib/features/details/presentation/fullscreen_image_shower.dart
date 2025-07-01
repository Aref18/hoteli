import 'package:flutter/material.dart';
import 'package:hoteli/core/utils/network.dart';
import 'package:photo_view/photo_view.dart';

class FullscreenImageShower extends StatefulWidget {
  final String UrlImage;

  FullscreenImageShower({super.key, required this.UrlImage});

  @override
  State<FullscreenImageShower> createState() => _FullscreenImageShowerState();
}

class _FullscreenImageShowerState extends State<FullscreenImageShower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          enableRotation: false,
          backgroundDecoration: BoxDecoration(color: Colors.black),
          initialScale: PhotoViewComputedScale.contained * 1,
          imageProvider: NetworkImage(
            networkUrl(widget.UrlImage),
          ),
        ),
      ),
    );
  }
}
