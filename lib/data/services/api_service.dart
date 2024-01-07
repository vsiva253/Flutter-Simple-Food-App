import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:temp_practice/data/modals/restaurant_modal.dart';

// location_service.dart
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  bool locationLoaded = false;
  late Position currentPosition;
  String currentAddress = "";

  Future<void> getCurrentLocation() async {
    if (!locationLoaded) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        currentPosition = position;
        locationLoaded = true;

        // Get the address using geocoding
        List<Placemark> placemarks = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude);

        currentAddress =
            "${placemarks.first.name}, ${placemarks.first.locality}";
      } catch (e) {
        print('Error getting current location: $e');
        // Handle error gracefully
        // currentPosition = (latitude: 0.0, longitude: 0.0;
        currentAddress = "Unknown";
      }
    }
  }
}

class Api {
  static const baseUrl = "https://theoptimiz.com/restro/public/api/";
  static const restaurantsEndpoint = "get_resturants";

  static Future<List<Restaurant>> getRestaurants(double lat, double lng) async {
    final response = await http.post(
      Uri.parse(baseUrl + restaurantsEndpoint),
      body: json.encode({"lat": lat, "lng": lng}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse["data"];
      return data.map((item) => Restaurant.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
