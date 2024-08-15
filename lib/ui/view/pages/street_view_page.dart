import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart'
    as street_view;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class StreetViewPage extends StatefulWidget {
  final google_maps.LatLng? position;

  const StreetViewPage({super.key, this.position});

  @override
  State<StreetViewPage> createState() => _StreetViewPageState();
}

class _StreetViewPageState extends State<StreetViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.position == null
            ? const Center(child: Text('No position selected'))
            : street_view.FlutterGoogleStreetView(
                zoomControl: true,
                initPos: street_view.LatLng(
                    widget.position!.latitude, widget.position!.longitude),
                initSource: street_view.StreetViewSource.outdoor,
              ),
      ),
    );
  }
}
