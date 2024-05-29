// import 'package:location/location.dart';

// class LocationService {
//   Location location = Location();

// bool _serviceEnabled;
// PermissionStatus _permissionGranted;
// LocationData _locationData;

// _serviceEnabled = await location.serviceEnabled();
// if (!_serviceEnabled) {
//   _serviceEnabled = await location.requestService();
//   if (!_serviceEnabled) {
//     return;
//   }
// }

// _permissionGranted = await location.hasPermission();
// if (permissionGranted == PermissionStatus.denied) {
//   permissionGranted = await location.requestPermission();
//   if (permissionGranted != PermissionStatus.granted) {
//     return;
//   }
// }

// _locationData = await location.getLocation();
// }
