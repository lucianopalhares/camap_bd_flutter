import 'package:flutter_dotenv/flutter_dotenv.dart'; 

class LocationUtil {

  static String generateLocationPreviewImage({
    double? latitude, 
    double? longitude,
  }) {

    String? GOOGLE_API_KEY = dotenv.env['GOOGLE_API_KEY'];

    String url = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=400x400&key=$GOOGLE_API_KEY';

    return url;
  }
}