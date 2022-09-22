import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class CityModalBottomSheet extends StatelessWidget {
  double longitude;
  double latitude;

  CityModalBottomSheet(
      {Key? key, required this.longitude, required this.latitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text("Localisation ville"),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: FlutterMap(
            options: MapOptions(
              center: LatLng(latitude, longitude),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/ctravers/cl15n519m000215qp1mn5lhuy/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}",
                additionalOptions: const {
                  "access_token":
                      "pk.eyJ1IjoiY3RyYXZlcnMiLCJhIjoiY2wwYjY3bTQwMG1kbDNqcDZhNTZjNWkwZSJ9.w6JrxX_SNlkt0wREYYWwtQ"
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(latitude, longitude),
                    width: 80,
                    height: 80,
                    builder: (context) => const Icon(
                      Icons.location_pin,
                      size: 40,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
