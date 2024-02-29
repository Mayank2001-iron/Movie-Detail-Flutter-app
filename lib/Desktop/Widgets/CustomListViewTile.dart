

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../Pages/MovieDetailPage.dart';
import '../Pages/ShowDetailPage.dart';

class CustomListViewTile extends StatelessWidget {
  String id;
  String imageUrl;
  String title;
  String year;
  String contentType;
  // Movie subobject;
  CustomListViewTile(
      {super.key,
      // required this.subobject,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.year,
      required this.contentType,
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
                if(contentType=="movie") {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>(MovieDetailPage(id: id,))));
                } else {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>(ShowDetailPage(id: id))));
                }
              },
              // onHover: (value)=>showPopover(
              //   context: context, 
              //   bodyBuilder: (context) => Text('Menu'),
              //   width:100,
              //   height: 100,
              //   backgroundColor: Colors.amber,
              //   ),
              child: SizedBox(
                height: 250,
                width: 180,
                // ignore: unnecessary_null_comparison
                child: (imageUrl==null)?LottieBuilder.asset('assets/images/loading_animation.json'):Container(
                  // height: 250,
                  // width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          // object[index].posterPath!,
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const Gap(10),
            Text(
                // object[index].title!,
                title,
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            Text(year), //'${object[index].releaseDate?.year}'
          ],
        ),
      ),
    );
  }
}
