



// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies3/Desktop/Pages/MovieDetailPage.dart';

import '../../Models/moviesById.dart';

class CustomListViewTileForMovie extends StatelessWidget {
  // String id;
  // String imageUrl;
  // String title;
  // String year;
  SimilarMovie subobject;
  CustomListViewTileForMovie(
      {super.key,
      required this.subobject,
      // required this.id,
      // required this.imageUrl,
      // required this.title,
      // required this.year
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 180,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                // if(subobject.contentType==ContentType.MOVIE)
              // (context)=>MovieDetailPage(id:subobject.id.toString());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailPage(id:"${subobject.id}",)));
                // else
                // Get.to(ShowDetailPage(id: id));
              },
              child: SizedBox(
                height: 250,
                width: 180,
                child: Container(
                  // height: 250,
                  // width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          // object[index].posterPath!,
                          subobject.posterPath!,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const Gap(10),
            Text(
              // object[index].title!,
              subobject.title!,
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(""), //'${object[index].releaseDate?.year}'
          ],
        ),
      ),
    );
  }
}

