import 'dart:convert';
import 'package:http/http.dart' as http;

MoviesApiCall() async
{
  MoviesModel movies;
  var response = await http.get(
    Uri.parse('https://movies-api14.p.rapidapi.com/movies'),
     headers: {
    'X-RapidAPI-Key': '468f91dc8amshf41865004d75b0ap1a384fjsnf2ae337d8f13',
    'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
  }
    );
    if(response.statusCode==200)
    {
      print('Success');
      
    }
    else{
      print('Error');
    }
  String responseString = response.body;
  movies = MoviesModel.fromRawJson(responseString);
  return movies;
}



class MoviesModel {
    List<Movie>? movies;
    int? page;

    MoviesModel({
        this.movies,
        this.page,
    });

    factory MoviesModel.fromRawJson(String str) => MoviesModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        movies: json["movies"] == null ? [] : List<Movie>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "movies": movies == null ? [] : List<dynamic>.from(movies!.map((x) => x.toJson())),
        "page": page,
    };
}

class Movie {
    int? id;
    String? backdropPath;
    List<String>? genres;
    String? originalTitle;
    String? overview;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    String? contentType;

    Movie({
        this.id,
        this.backdropPath,
        this.genres,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.contentType,
    });

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        backdropPath: json["backdrop_path"],
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"],
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "backdrop_path": backdropPath,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "contentType": contentType,
    };
}
