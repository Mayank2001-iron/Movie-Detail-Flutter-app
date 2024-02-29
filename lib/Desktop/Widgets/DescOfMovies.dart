

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies3/Desktop/Pages/ShowDetailPage.dart';

import '../Pages/MovieDetailPage.dart';

class DescWithMovies extends StatelessWidget {
  String contentType;
  String id;
  String title;
  String year;
  String genre;
  String description;
  DescWithMovies(
      {super.key,
      required this.id,
      required this.title,
      this.contentType = 'movie',
      required this.year,
      required this.genre,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 600,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(30),
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const Gap(5),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.red,
              ),
              const Gap(3),
              const Text('8.2'),
              const Gap(20),
              const Text('2023'),
              const Gap(20),
              Text(genre),
            ],
          ),
          const Gap(20),
          Text(
            description,
            maxLines: 6,
          ),
          const Gap(20),
          Row(
            children: [
              const Gap(10),
              GestureDetector(
                onTap: (){
                  if(contentType=='movie')
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailPage(id: id)));
                  else 
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetailPage(id: id)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 20, 5),
                      borderRadius: BorderRadius.circular(3)),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Row(
                      children: [
                        Text('Details'),
                        Gap(10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ],
      ),
    );
  }
}
