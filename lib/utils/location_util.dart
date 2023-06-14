import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
class LocationUtil {

  static String generateLocationPreviewImage({
    double? latitude, 
    double? longitude,
  }) {

    const GOOGLE_API_KEY = String.fromEnvironment('GOOGLE_API_KEY');

    String url = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=400x400&key=$GOOGLE_API_KEY';

    return url;
  }

  static Future<String> getAddressFrom(LatLng position) async {

    const GOOGLE_API_KEY = String.fromEnvironment('GOOGLE_API_KEY');

    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$GOOGLE_API_KEY';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}