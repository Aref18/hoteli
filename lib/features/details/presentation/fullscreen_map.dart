import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FullscreenMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String hotelName;

  const FullscreenMap(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.hotelName});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialZoom: 15.0,
          interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
          initialCenter: LatLng(latitude, longitude),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.v.hoteli',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 80,
                height: 80,
                child: Column(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      color: Colors.white.withOpacity(0.8),
                      child: Text(
                        hotelName,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:
                            textTheme.bodySmall!.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
