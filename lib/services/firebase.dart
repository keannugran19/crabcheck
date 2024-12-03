import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:http/http.dart' as http;

class FirebaseService {
  // call the collection
  final crabs = FirebaseFirestore.instance.collection('crabData');
  // call the storage
  final storage = FirebaseStorage.instance.ref;

  // reverse geocoding
  Future<String> getAddressFromCoordinates(GeoPoint? location) async {
    if (location == null) return 'Unknown Location';
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?lat=${location.latitude}&lon=${location.longitude}&format=json&addressdetails=1',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final address = data['address'];
        final barangay = address['suburb'] ?? address['village'] ?? '';
        final city =
            address['city'] ?? address['town'] ?? address['municipality'] ?? '';

        return 'Brgy. ${barangay.isNotEmpty ? barangay + ', ' : ''}$city City';
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Unknown Location';
    }
  }
}
