import 'dart:html';

import 'package:location/location.dart';
import 'dart:developer';


Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return;
  }
}

location.onLocationChanged.listen((LocationData currentLocation) {
  // Use current location
  log('Localização alterada');
});