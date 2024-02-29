import 'dart:convert';
import 'package:http/http.dart' as http;

SearchCallApi(query) async {
    late SearchModel searchModelData;
    var response = await http.get(
        Uri.parse('https://movies-api14.p.rapidapi.com/search?query=$query'),
         headers: {
    'X-RapidAPI-Key': '468f91dc8amshf41865004d75b0ap1a384fjsnf2ae337d8f13',
    'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
  });
    String responseString = response.body;
    searchModelData = SearchModel.fromRawJson(responseString);
    return searchModelData;
    // try {
    //   if (response.statusCode == 200) {
    //     String responseString = response.body;
    //     searchModelData = SearchModel.fromRawJson(responseString);
    //     setState(() {
    //       searchModelDataBool = true;
    //     });
    //   }
    // } catch (e) {
    //   print('error');
    // }
  }





class SearchModel {
    String? query;
    List<Content>? contents;

    SearchModel({
        this.query,
        this.contents,
    });

    factory SearchModel.fromRawJson(String str) => SearchModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        query: json["query"],
        contents: json["contents"] == null ? [] : List<Content>.from(json["contents"]!.map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "query": query,
        "contents": contents == null ? [] : List<dynamic>.from(contents!.map((x) => x.toJson())),
    };
}

class Content {
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
    String? contentType;
    DateTime? firstAired;

    Content({
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
        this.contentType,
        this.firstAired,
    });

    factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Content.fromJson(Map<String, dynamic> json) => Content(
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
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "youtube_trailer": youtubeTrailer,
        "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
        "contentType": contentType,
        "first_aired": "${firstAired!.year.toString().padLeft(4, '0')}-${firstAired!.month.toString().padLeft(2, '0')}-${firstAired!.day.toString().padLeft(2, '0')}",
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
