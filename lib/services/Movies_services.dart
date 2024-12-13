import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/config/config.dart';
import 'package:movie_app/models/Movie_model.dart';

class MovieServices {
  static Future<List<MovieModel>> getMovielist() async {
    List<MovieModel> listMovie = [];

    try {
      var response = await http.get(Uri.parse(Config.UrlApi()));
      print(response);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        List listAllMoviesResponse = responseBody['results'];

        listAllMoviesResponse.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
      } else {
        listMovie = [];
      }
      print(listMovie[0].toJson());
    } catch (e) {
      print(e);
    }
    return listMovie;
  }
}
