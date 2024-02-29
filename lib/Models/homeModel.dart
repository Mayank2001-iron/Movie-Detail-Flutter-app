
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<HomeModel>> HMApiCall() async {
  var response = await http.get(
    Uri.parse('https://movies-api14.p.rapidapi.com/home'),
     headers: {
    
  }
  );

  final list = jsonDecode(response.body) as List<dynamic>;
  return list.map((e) => HomeModel.fromJson(e)).toList();
  // var items = list as List<HomeModel>;
  // return items;
}

class HomeModel {
    String? title;
    List<Movie>? movies;

    HomeModel({
        this.title,
        this.movies,
    });

    factory HomeModel.fromRawJson(String str) => HomeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        title: json["title"],
        movies: json["movies"] == null ? [] : List<Movie>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "movies": movies == null ? [] : List<dynamic>.from(movies!.map((x) => x.toJson())),
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
    DateTime? firstAired;

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
        this.firstAired,
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
        firstAired: json["first_aired"] == null ? null : DateTime.parse(json["first_aired"]),
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
        "first_aired": "${firstAired!.year.toString().padLeft(4, '0')}-${firstAired!.month.toString().padLeft(2, '0')}-${firstAired!.day.toString().padLeft(2, '0')}",
    };
}
