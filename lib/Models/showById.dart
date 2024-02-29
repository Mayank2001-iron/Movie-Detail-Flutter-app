import 'dart:convert';
import 'package:http/http.dart' as http;

ShowByIdApiCall(String id) async {
  late ShowById showById;
  var response = await http.get(
      Uri.parse('https://movies-api14.p.rapidapi.com/show/$id'),
       headers: {
   
  });
  String responseString = response.body;
  showById = ShowById.fromRawJson(responseString);
  return showById;
  // try {
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       showByIdBool = true;
  //     });
  //   }
  // } catch (e) {
  //   print('error');
  // }
}


class ShowById {
    Show? show;
    List<Season>? seasons;

    ShowById({
        this.show,
        this.seasons,
    });

    factory ShowById.fromRawJson(String str) => ShowById.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ShowById.fromJson(Map<String, dynamic> json) => ShowById(
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
        seasons: json["seasons"] == null ? [] : List<Season>.from(json["seasons"]!.map((x) => Season.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "show": show?.toJson(),
        "seasons": seasons == null ? [] : List<dynamic>.from(seasons!.map((x) => x.toJson())),
    };
}

class Season {
    int? season;
    List<Episode>? episodes;

    Season({
        this.season,
        this.episodes,
    });

    factory Season.fromRawJson(String str) => Season.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        season: json["season"],
        episodes: json["episodes"] == null ? [] : List<Episode>.from(json["episodes"]!.map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "season": season,
        "episodes": episodes == null ? [] : List<dynamic>.from(episodes!.map((x) => x.toJson())),
    };
}

class Episode {
    int? id;
    int? episodeNumber;
    DateTime? firstAired;
    int? seasonNumber;
    int? showId;
    String? thumbnailPath;
    String? title;
    List<Source>? sources;
    bool? availability;

    Episode({
        this.id,
        this.episodeNumber,
        this.firstAired,
        this.seasonNumber,
        this.showId,
        this.thumbnailPath,
        this.title,
        this.sources,
        this.availability,
    });

    factory Episode.fromRawJson(String str) => Episode.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["_id"],
        episodeNumber: json["episode_number"],
        firstAired: json["first_aired"] == null ? null : DateTime.parse(json["first_aired"]),
        seasonNumber: json["season_number"],
        showId: json["show_id"],
        thumbnailPath: json["thumbnail_path"],
        title: json["title"],
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
        availability: json["availability"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "episode_number": episodeNumber,
        "first_aired": "${firstAired!.year.toString().padLeft(4, '0')}-${firstAired!.month.toString().padLeft(2, '0')}-${firstAired!.day.toString().padLeft(2, '0')}",
        "season_number": seasonNumber,
        "show_id": showId,
        "thumbnail_path": thumbnailPath,
        "title": title,
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
        "availability": availability,
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

class Show {
    int? id;
    String? backdropPath;
    DateTime? firstAired;
    List<String>? genres;
    String? originalTitle;
    String? overview;
    String? posterPath;
    String? title;
    double? voteAverage;
    int? voteCount;
    String? youtubeTrailer;
    List<Source>? sources;

    Show({
        this.id,
        this.backdropPath,
        this.firstAired,
        this.genres,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.title,
        this.voteAverage,
        this.voteCount,
        this.youtubeTrailer,
        this.sources,
    });

    factory Show.fromRawJson(String str) => Show.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["_id"],
        backdropPath: json["backdrop_path"],
        firstAired: json["first_aired"] == null ? null : DateTime.parse(json["first_aired"]),
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        youtubeTrailer: json["youtube_trailer"],
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
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
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "youtube_trailer": youtubeTrailer,
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
    };
}
