

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies3/UserBloc/User_Bloc.dart';
import 'package:movies3/UserBloc/User_Event.dart';

import '../../Models/moviesById.dart';
import '../Widget/CustomCachedImage.dart';
import '../Widget/TextWithbarMobile.dart';

class MovieDetailMobile extends StatefulWidget {
  String id;
  MovieDetailMobile({super.key, this.id = '585511'});

  @override
  State<MovieDetailMobile> createState() => _MovieDetailMobileState();
}

class _MovieDetailMobileState extends State<MovieDetailMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w500),),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FutureBuilder(
              future: MoviesByIdApiCall(widget.id),
              builder: (context, data) {
                if (data.hasData) {
                  var object = data.data as MovieById; //items[index].title
                  return Column(
                    children: [
                      MainPosterMobile2(object: object.movie!),
                      Container(
                        padding: const EdgeInsets.all(12),
                        // color: Colors.amber,
                        child: Text(
                          object.movie!.overview!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                            child: TextWithBarMobile(title: 'Similar Movies'),
                          ),
                          SizedBox(
                            // color: Colors.blue,
                            width: MediaQuery.sizeOf(context).width,
                            height: 260,
                            //  decoration: BoxDecoration(
                            //   color: Colors.blue,
                            //   // borderRadius: BorderRadius.circular(10),
                            // ),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: object.similarMovies!.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MovieDetailMobile(id: object.similarMovies![index].id.toString(),)));
                                            },
                                            child: SizedBox(
                                              height: 193,
                                              width: 150,
                                              child: CustomCachedImage(imgUrl:object.similarMovies![index].posterPath!, radius: 10,),
                                              // decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(10),
                                              //     image: DecorationImage(
                                              //       image: NetworkImage(
                                              //           object.similarMovies![index].posterPath!),
                                              //       fit: BoxFit.cover,
                                              //     ),
                                              
                                            // ),
                                            ),
                                          ),
                                          const Gap(5),
                                          Text(object.similarMovies![index].title!,overflow: TextOverflow.ellipsis,),                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ],
                      )
                    ],
                  );
                } else if (data.hasError) {
                  return Center(
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: LottieBuilder.asset(
                              'assets/images/error_animation.json')));
                } else {
                  return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Center(
                              child: LottieBuilder.asset(
                                  'assets/images/Plane_Loading.json'),
                            ));
                }
              }),

          // Column(
          //   children: [
          //     // MainPosterMobile(),
          //     Container(
          //       padding: EdgeInsets.all(12),
          //       // color: Colors.amber,
          //       child: Text(
          //         "In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.",
          //         maxLines: 4,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ),
          //     Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           TextWithBarMobile(title: 'Similar Movies'),
          //           Container(
          //             // color: Colors.blue,
          //             width: MediaQuery.sizeOf(context).width,
          //             height: 260,
          //             //  decoration: BoxDecoration(
          //             //   color: Colors.blue,
          //             //   // borderRadius: BorderRadius.circular(10),
          //             // ),
          //             child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: 10,
          //                 itemBuilder: ((context, index) {
          //                   return Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         GestureDetector(
          //                           onTap: () {
          //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailMobile()));
          //                           },
          //                           child: Container(
          //                             height: 193,
          //                             width: 150,
          //                             decoration: BoxDecoration(
          //                                 borderRadius: BorderRadius.circular(10),
          //                                 image: DecorationImage(
          //                                   image: NetworkImage(
          //                                       'assets/images/profile.jpg'),
          //                                   fit: BoxFit.cover,
          //                                 )),
          //                           ),
          //                         ),
          //                         Gap(5),
          //                         Text('Movie'),
          //                         Gap(5),
          //                         Text('2024'),
          //                       ],
          //                     ),
          //                   );
          //                 })),
          //           ),
          //         ],
          //       )
          //   ],
          // ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainPosterMobile2 extends StatelessWidget {
  Movie object;
  MainPosterMobile2({super.key, required this.object});
  double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(radius),
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 5,
              spreadRadius: 0.5,
            ),
            BoxShadow(
              color: Colors.grey.shade800.withOpacity(0.5),
              offset: const Offset(-4, -4),
              blurRadius: 5,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Stack(
          children: [
            SizedBox(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              child: CustomCachedImage(imgUrl: object.backdropPath!,radius: radius,),
              // decoration: BoxDecoration(
              //     // color: Colors.purple,
              //     borderRadius: BorderRadius.circular(radius),
              //     image: DecorationImage(
              //         image: NetworkImage(object.backdropPath!),
              //         fit: BoxFit.cover)),
            ),
            Container(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                // color: Colors.black45,
                gradient: const LinearGradient(
                    colors: [Colors.black45, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            Container(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                // color: Colors.black45,
                gradient: const LinearGradient(
                    colors: [Colors.black45, Colors.transparent],
                    begin: Alignment.centerLeft,
                    end: Alignment.center),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            Container(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                // color: Colors.black45,
                gradient: const LinearGradient(
                    colors: [Colors.black45, Colors.transparent],
                    begin: Alignment.centerRight,
                    end: Alignment.center),
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: SizedBox(
                // color: Colors.purple,
                // width: MediaQuery,
                width: 300,
                // height: MediaQuery.sizeOf(context).height * 0.4,
                // decoration: BoxDecoration(
                //   // color: Colors.black45,
                //   gradient: LinearGradient(colors: [Colors.black,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.center),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      object.title!,
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Gap(10),
                    Text((object.releaseDate==null)?"":object.releaseDate!.year.toString()),
                    const Gap(10),
                    // Container(
                    //   width: 110,
                    //   padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //   decoration: BoxDecoration(
                    //     color: const Color.fromARGB(255, 223, 22, 8),
                    //     borderRadius: BorderRadius.circular(radius),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text('Details'),
                    //       Gap(5),
                    //       Icon(Icons.arrow_forward),
                    //     ],
                    //   ),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Color.fromARGB(255, 223, 22, 8),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Text('Details'),
                    //       Gap(10),
                    //       Icon(Icons.arrow_forward),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: (){
                  context.read<UserBloc>().add(UserAddFavMovieEvent());
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
