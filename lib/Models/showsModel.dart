
import 'dart:convert';
import 'package:http/http.dart' as http;

ShowsApiCall() async {
  late ShowsModel showsData;
  var response = await http
      .get(Uri.parse('https://movies-api14.p.rapidapi.com/shows'), headers: {
    
  });

  String responseString = response.body;
  showsData = ShowsModel.fromRawJson(responseString);
  return showsData;
  // if (response.statusCode == 200) {
  //   String responseString = response.body;
  //   print('success');
  //   showsData = ShowsModel.fromRawJson(responseString);
  // } else {
  //   print('error');
  // }
}

class ShowsModel {
    List<Movie>? movies;
    int? page;

    ShowsModel({
        this.movies,
        this.page,
    });

    factory ShowsModel.fromRawJson(String str) => ShowsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ShowsModel.fromJson(Map<String, dynamic> json) => ShowsModel(
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
    DateTime? firstAired;
    List<String>? genres;
    String? originalTitle;
    String? overview;
    String? posterPath;
    String? title;
    String? contentType;

    Movie({
        this.id,
        this.backdropPath,
        this.firstAired,
        this.genres,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.title,
        this.contentType,
    });

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        backdropPath: json["backdrop_path"],
        firstAired: json["first_aired"] == null ? null : DateTime.parse(json["first_aired"]),
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "backdrop_path": backdropPath,
        "first_aired": "${firstAired!.year.toString().padLeft(4, '0')}-${firstAired!.month.toString().padLeft(2, '0')}-${firstAired!.day.toString().padLeft(2, '0')}",
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "title": title,
        "contentType": contentType,
    };
}
