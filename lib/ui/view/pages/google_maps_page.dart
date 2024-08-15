import 'dart:async';

import 'package:binamod/ui/view/pages/street_view_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  final Completer<google_maps.GoogleMapController> _mapsController =
      Completer();
  var startPosition = const google_maps.CameraPosition(
    target: google_maps.LatLng(40.9810569, 29.1999809),
    zoom: 9,
  );
  google_maps.LatLng? _markerPosition;
  final TextEditingController _searchController = TextEditingController();

  void _confirmMarkerPlacement(google_maps.LatLng position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 10,
          title: const Text(
            "Confirm Location",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Do you want to go to this location?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StreetViewPage(position: _markerPosition!),
                  ),
                ).then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _searchLocation(String query) async {
    try {
      final locations = await locationFromAddress(query);

      if (locations.isNotEmpty) {
        final location = locations.first;
        final newLatLng =
            google_maps.LatLng(location.latitude, location.longitude);

        setState(() {
          _markerPosition = newLatLng;
        });

        final google_maps.GoogleMapController controller =
            await _mapsController.future;
        controller.animateCamera(
          google_maps.CameraUpdate.newCameraPosition(
            google_maps.CameraPosition(target: newLatLng, zoom: 14),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No results found.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            google_maps.GoogleMap(
              initialCameraPosition: startPosition,
              mapType: google_maps.MapType.normal,
              onMapCreated: (google_maps.GoogleMapController controller) {
                _mapsController.complete(controller);
              },
              onCameraMove: (google_maps.CameraPosition position) {
                setState(() {
                  _markerPosition = position.target;
                });
              },
              onTap: (google_maps.LatLng position) {
                _confirmMarkerPlacement(position);
              },
            ),
            if (_markerPosition != null)
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_markerPosition != null) {
                      _confirmMarkerPlacement(_markerPosition!);
                    }
                  },
                  child: const Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search location",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                    ),
                    onSubmitted: (value) {
                      _searchLocation(value);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
