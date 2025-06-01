import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hoteli/core/utils/network.dart';

class StoryCarousel extends StatefulWidget {
  List<String> images;
  List<String> titles;
  StoryCarousel({super.key, required this.images, required this.titles});

  @override
  State<StoryCarousel> createState() => _StoryCarouselState();
}

class _StoryCarouselState extends State<StoryCarousel> {
  int _currectimag = 0;
  late Timer _timer;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _startstory();
  }

  void _startstory() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currectimag < widget.images.length - 1) {
        _currectimag++;
      } else {
        _currectimag = 0;
      }
    });

    _carouselSliderController.animateToPage(_currectimag);
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _Nextpage() {
    setState(() {
      if (_currectimag < widget.images.length - 1) {
        _currectimag++;
      } else {
        _currectimag = 0;
      }
      _carouselSliderController.animateToPage(_currectimag);
    });
  }

  void _Pervspage() {
    setState(() {
      if (_currectimag > 0) {
        _currectimag--;
      } else {
        _currectimag < widget.images.length - 1;
      }

      _carouselSliderController.animateToPage(_currectimag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselSliderController,
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayCurve: Curves.bounceIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                _currectimag = index;
              },
              scrollDirection: Axis.horizontal,
            ),
            items: widget.images.map((imageUrl) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(networkUrl(imageUrl), fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.75),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(widget.images.length, (index) {
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color:
                            _currectimag >= index ? Colors.brown : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Text(
              widget.titles[_currectimag],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 100,
            child: GestureDetector(
              onTap: _Nextpage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                child: const Icon(Icons.chevron_right, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 100,
            child: GestureDetector(
              onTap: _Pervspage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                child: const Icon(Icons.chevron_left, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
