import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../components/form_dialog.dart';

class ManualLocationTaggingPage extends StatefulWidget {
  final String label;
  final XFile filePath;
  final String taggingType;
  const ManualLocationTaggingPage(
      {super.key,
      required this.label,
      required this.filePath,
      required this.taggingType});

  @override
  State<ManualLocationTaggingPage> createState() =>
      _ManualLocationTaggingPageState();
}

class _ManualLocationTaggingPageState extends State<ManualLocationTaggingPage> {
  double latitude = 0;
  double longitude = 0;

  final double initialCenterLat = 7.30215;
  final double initialCenterLon = 125.68145;

  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: backgroundColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Tag Location Manually",
          style: TextStyle(color: backgroundColor, fontSize: 18),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                  onTap: (tapPosition, point) {
                    setState(() {
                      latitude = point.latitude;
                      longitude = point.longitude;
                    });
                  },
                  initialCenter: LatLng(initialCenterLat, initialCenterLon),
                  initialZoom: 13,
                  minZoom: 12),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    // use location marker
                    Marker(
                        point: LatLng(latitude, longitude),
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 50,
                        )),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 320,
                      child: Button(
                          buttonText: "Set Location",
                          buttonColor: primaryColor,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: FormDialog(
                                    label: widget.label,
                                    filePath: widget.filePath,
                                    latitude: latitude,
                                    longitude: longitude,
                                    taggingType: widget.taggingType,
                                  ),
                                );
                              },
                            );
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
