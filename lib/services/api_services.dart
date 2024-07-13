import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photo_model.dart';

class ApiServices {
  static const baseUrl = "https://api.pexels.com/v1/";
  static const photo = "curated?per_page=1";

  Future<PhotoModel?> getPhotos() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          "Authorization": "T3nJoI4wTTQoAGSaiQq7c96wbzqKDmWcz45NSpsjHowpdgVCYWMOANDg",
        },
      );
      
      if (response.statusCode == 200) {
        var data = response.body;
        PhotoModel apiData = photoModelFromJson(data);
        return apiData;
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
    return null;
  }
}
