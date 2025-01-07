import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crabcheck/components/button.dart';
import 'package:crabcheck/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../utilities/tagging.dart';

class ManualLocationTaggingPage extends StatefulWidget {
  final String label;
  final XFile filePath;
  const ManualLocationTaggingPage(
      {super.key, required this.label, required this.filePath});

  @override
  State<ManualLocationTaggingPage> createState() =>
      _ManualLocationTaggingPageState();
}

class _ManualLocationTaggingPageState extends State<ManualLocationTaggingPage> {
  // call tagging util
  Tagging tagging = Tagging();

  double latitude = 0;
  double longitude = 0;

  final double initialCenterLat = 7.30215;
  final double initialCenterLon = 125.68145;

  late MapController mapController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  // method to set the location
  Future<void> _handleTagging() async {
    setState(() => isLoading = true);

    // Show the "Please wait" dialog
    tagging.showLoadingDialog(context);

    try {
      // Determine position and upload file
      final loc = GeoPoint(latitude, longitude);
      final downloadUrl = await tagging.uploadFile(widget.filePath);

      // Save data to Firestore
      await tagging.saveToFirestore(loc, downloadUrl, widget.label);

      // Close loading dialog after upload is complete
      if (mounted) Navigator.of(context).pop();

      // Show success dialog
      if (mounted) tagging.showSuccessDialog(context);
    } catch (e) {
      // Close loading dialog in case of an error
      if (mounted) Navigator.of(context).pop();

      // ignore: use_build_context_synchronously
      tagging.showErrorSnackBar(e, context);
    } finally {
      setState(() => isLoading = false);
    }
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
                          onPressed: _handleTagging)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
