import 'dart:convert';
import 'package:http/http.dart' as http;

MoviesByIdApiCall(String id) async {
  late MovieById moviesById;
  var response = await http.get(
      Uri.parse('https://movies-api14.p.rapidapi.com/movie/$id'),
       headers: {
    'X-RapidAPI-Key': '468f91dc8amshf41865004d75b0ap1a384fjsnf2ae337d8f13',
    'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
  });
  String responseString = response.body;
  moviesById = MovieById.fromRawJson(responseString);
  return moviesById;

  // try {
  //   if(response.statusCode==200)
  //   {
  //     String responseString = response.body;
  //     moviesById = MoviesById.fromRawJson(responseString);
  //     setState(() {
  //       moviesByIdBool = true;
  //     });
  //   }
  // } catch (e) {
  //   print(e);
  // }
}



class MovieById {
    Movie? movie;
    List<SimilarMovie>? similarMovies;

    MovieById({
        this.movie,
        this.similarMovies,
    });

    factory MovieById.fromRawJson(String str) => MovieById.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieById.fromJson(Map<String, dynamic> json) => MovieById(
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        similarMovies: json["similarMovies"] == null ? [] : List<SimilarMovie>.from(json["similarMovies"]!.map((x) => SimilarMovie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "movie": movie?.toJson(),
        "similarMovies": similarMovies == null ? [] : List<dynamic>.from(similarMovies!.map((x) => x.toJson())),
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
    double? voteAverage;
    int? voteCount;
    String? youtubeTrailer;
    List<Source>? sources;

    Movie({
        this.id,
        this.backdropPath,
        this.genres,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.voteAverage,
        this.voteCount,
        this.youtubeTrailer,
        this.sources,
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
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        youtubeTrailer: json["youtube_trailer"],
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
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
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "youtube_trailer": youtubeTrailer,
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
    };
}

class Source {
    String? source;
    String? link;
    String? type;
    String? displayName;
    String? info;
    Platform? platform;

    Source({
        this.source,
        this.link,
        this.type,
        this.displayName,
        this.info,
        this.platform,
    });

    factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        source: json["source"],
        link: json["link"],
        type: json["type"],
        displayName: json["display_name"],
        info: json["info"],
        platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "link": link,
        "type": type,
        "display_name": displayName,
        "info": info,
        "platform": platform?.toJson(),
    };
}

class Platform {
    String? android;
    String? androidTv;
    String? ios;
    String? web;

    Platform({
        this.android,
        this.androidTv,
        this.ios,
        this.web,
    });

    factory Platform.fromRawJson(String str) => Platform.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        android: json["android"],
        androidTv: json["android_tv"],
        ios: json["ios"],
        web: json["web"],
    );

    Map<String, dynamic> toJson() => {
        "android": android,
        "android_tv": androidTv,
        "ios": ios,
        "web": web,
    };
}

class SimilarMovie {
    int? id;
    String? posterPath;
    String? title;
    String? contentType;
    String? backdropPath;

    SimilarMovie({
        this.id,
        this.posterPath,
        this.title,
        this.contentType,
        this.backdropPath,
    });

    factory SimilarMovie.fromRawJson(String str) => SimilarMovie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SimilarMovie.fromJson(Map<String, dynamic> json) => SimilarMovie(
        id: json["_id"],
        posterPath: json["poster_path"],
        title: json["title"],
        contentType: json["contentType"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "poster_path": posterPath,
        "title": title,
        "contentType": contentType,
        "backdrop_path": backdropPath,
    };
}
