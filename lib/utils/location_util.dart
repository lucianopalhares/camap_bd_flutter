class LocationUtil {

  static String generateLocationPreviewImage({
    double? latitude, 
    double? longitude,
  }) {

    const GOOGLE_API_KEY = String.fromEnvironment('GOOGLE_API_KEY');

    String url = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=400x400&key=$GOOGLE_API_KEY';

    return url;
  }
}