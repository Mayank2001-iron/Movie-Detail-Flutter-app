

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Models/showById.dart';
import '../../StreamServiceMap.dart';
import '../../UserBloc/User_Bloc.dart';
import '../../UserBloc/User_Event.dart';
import '../Widget/CustomCachedImage.dart';
import '../Widget/TextWithbarMobile.dart';

class ShowDetailMobile extends StatefulWidget {
  String id;
  ShowDetailMobile({super.key, required this.id});

  @override
  State<ShowDetailMobile> createState() => _ShowDetailMobileState();
}

class _ShowDetailMobileState extends State<ShowDetailMobile> {
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
            future: ShowByIdApiCall(widget.id),
            builder: (context, data) {
              if (data.hasData) {
                var item = data.data as ShowById;
                return Column(
                  children: [
                    MainPosterShowMobile(
                      object: item.show!,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      // color: Colors.amber,
                      child: Text(
                        item.show!.overview!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: TextWithBarMobile(title: 'Available On'),
                        ),
                        SizedBox(
                          // color: Colors.blue,
                          width: MediaQuery.sizeOf(context).width,
                          height: 185,
                          //  decoration: BoxDecoration(
                          //   color: Colors.blue,
                          //   // borderRadius: BorderRadius.circular(10),
                          // ),
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: item.show!.sources!.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: ()
                                        {
                                          launchMyUrl(item.show!.sources![index].info!,context);
                                        },
                                        child: Container(
                                          height: 140,
                                          width: 200,
                                        //   child: AssetImage((streamService[
                                        //                   item
                                        //                       .show!
                                        //                       .sources![index]
                                        //                       .source] ==
                                        //               null)
                                        //           ? streamService["black"]!
                                        //           : streamService[item.show!
                                        //               .sources![index].source]!,radius: 10,),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black,
                                            image: DecorationImage(
                                              image: AssetImage((streamService[
                                                          item
                                                              .show!
                                                              .sources![index]
                                                              .source] ==
                                                      null)
                                                  ? streamService["black"]!
                                                  : streamService[item.show!
                                                      .sources![index].source]!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(5),
                                      Text(item
                                          .show!.sources![index].displayName!),
                                    ],
                                  ),
                                );
                              })),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: TextWithBarMobile(title: 'Seasons'),
                            ),
                            SizedBox(
                              // color: Colors.blue,
                              width: MediaQuery.sizeOf(context).width,
                              height: 185,
                              //  decoration: BoxDecoration(
                              //   color: Colors.blue,
                              //   // borderRadius: BorderRadius.circular(10),
                              // ),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.seasons!.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(item
                                                      .seasons![index]
                                                      .episodes![0]
                                                      .thumbnailPath!),
                                                  fit: BoxFit.cover,
                                                )),
                                            child: CustomCachedImage(imgUrl:item
                                                      .seasons![index]
                                                      .episodes![0]
                                                      .thumbnailPath! ,radius: 10,),
                                          ),
                                          const Gap(5),
                                          Text("Season ${index + 1}"),
                                        ],
                                      ),
                                    );
                                  })),
                            ),
                          ],
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
                              child: LottieBuilder.network(
                                  'assets/images/Plane_Loading.json'),
                            ));
              }
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainPosterShowMobile extends StatelessWidget {
  Show object;
  MainPosterShowMobile({super.key, required this.object});
  double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
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
            Container(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              decoration: BoxDecoration(
                  // color: Colors.purple,
                  borderRadius: BorderRadius.circular(radius),
                  image: DecorationImage(
                      image: (object.backdropPath == null)
                          ? const NetworkImage('assets/images/Netflix-Symbol.png')
                          : NetworkImage(object.backdropPath!),
                      fit: BoxFit.cover)),
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
                    Text((object.firstAired == null)
                        ? ""
                        : object.firstAired!.year.toString()),
                    const Gap(10),
                    // GestureDetector(
                    //   onTap: () {
                    //     // if(object.contentType=="movie")
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailMobile(id:object.id.toString())));
                    //     // else
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetailMobile(id:object.id.toString())));
                    //   },
                    //   child: Container(
                    //     width: 110,
                    //       padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    //       decoration: BoxDecoration(
                    //         color: const Color.fromARGB(255, 223, 22, 8),
                    //         borderRadius: BorderRadius.circular(radius),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Text('Details'),
                    //           Gap(5),
                    //           Icon(Icons.arrow_forward),
                    //         ],
                    //       ),
                    //     ),
                    // ),
            Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: (){
                  context.read<UserBloc>().add(UserAddFavShowEvent());
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
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
