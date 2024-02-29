

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Models/homeModel.dart';
import 'CustomListViewTile.dart';
import 'TextWithRedBar.dart';

class ListofMoviesWithTitle extends StatelessWidget {
  String headTitle;
  // String object;
  List<Movie> object;
  ListofMoviesWithTitle(
      {super.key,
      required this.object,
      required this.headTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      // height: 350,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithRedBar(title: headTitle),
          Column(
            children: [
              const Gap(20),
              SizedBox(
                height: 320,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: object.length,
                    itemBuilder: (context, index) {
                      return CustomListViewTile(id:'${object[index].id}',imageUrl: object[index].posterPath!, title: object[index].title!, year: "",contentType: '${object[index].contentType}',);
                    }
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





// Container(
//       // color: Colors.amber,
//       // height: 350,
//       width: MediaQuery.sizeOf(context).width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   headTitle,
//                   style: GoogleFonts.poppins(
//                       fontSize: 25, fontWeight: FontWeight.w500),
//                 ),
//                 Container(
//                   color: Color.fromARGB(255, 228, 20, 5),
//                   height: 3,
//                   width: 50,
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Gap(20),
//               Container(
//                 height: 320,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: object.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 250,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                       // object[index].posterPath!,
//                                       "https://image.tmdb.org/t/p/original/3BSxAjiporlwQTWzaHZ9Yrl5C9D.jpg",
//                                     ),
//                                     fit: BoxFit.cover,
//                                   )),
//                             ),
//                             Gap(10),
//                             Text(
//                               // object[index].title!,
//                               "Dungeons & Dragons: Honor Among Thieves",
//                               // maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text('2024') //'${object[index].releaseDate?.year}'
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );




// Container(
//       color: Colors.amber,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             headTitle,
//             style:
//                 GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
//           ),
//           Container(
//                   color: Color.fromARGB(255, 228, 20, 5),
//                   height: 3,
//                   width: 50,
//                 ),


//           // container that contain list of movies
//           Container(
//             height: 300,
//             width: MediaQuery.sizeOf(context).width,
//             color: Colors.red,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (context,index){
//               return Container(
//                 height: 250,
//                 width: 200,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height:250 ,
//                       width: 200,
//                       // color: Colors.green,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(object),
//                           fit: BoxFit.cover
//                         )
//                       ), 
//                     ),
//                     Expanded(child: Text("Dungeons & Dragons: Honor Among Thieves",maxLines: 1,overflow: TextOverflow.ellipsis,)),
//                     Text('2024'),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );