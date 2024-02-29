import 'package:flutter/material.dart';

import '../../Models/homeModel.dart';
import 'DescOfMovies.dart';

// ignore: must_be_immutable
class MainPosterPage extends StatelessWidget {
  Movie movieObject;
  // String id;
  // String mainPosterString;
  // String title;
  // String genre;
  // String description;
  // String year;
  MainPosterPage(
      {super.key,
      required this.movieObject,
      // required this.id,
      // required this.mainPosterString,
      // required this.title,
      // required this.year,
      // required this.genre,
      // required this.description
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(movieObject.backdropPath!), fit: BoxFit.cover),
            )),

        Container(
          height: MediaQuery.sizeOf(context).height,
          width: 600,
          decoration: const BoxDecoration(
              // color: Colors.amber,
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.transparent])),
        ),

        Positioned(
          right: 0,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: 600,
            decoration: const BoxDecoration(
                // color: Colors.amber,
                gradient:
                    LinearGradient(colors: [Colors.transparent, Colors.black])),
          ),
        ),

        // widget for the title and description,
        Positioned(
            left: 200,
            top: 100,
            child: DescWithMovies(
                id:'${movieObject.id}',
                title: movieObject.title!,
                contentType: movieObject.contentType!,
                year: (movieObject.releaseDate==null)?"":"${movieObject.releaseDate!.year}",
                genre: (movieObject.genres==null)?"":"${movieObject.genres![0]}}",
                description: (movieObject.overview==null)?"":"${movieObject.overview}"
                ),
                ),
      ],
    );
  }
}
