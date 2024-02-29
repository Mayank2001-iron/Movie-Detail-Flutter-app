import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../Models/showById.dart';
import '../../StreamServiceMap.dart';
import '../Widgets/DescOfMovies.dart';
import '../Widgets/TextWithRedBar.dart';


// ignore: must_be_immutable
class ShowDetailPage extends StatefulWidget {
  String id;
  // String title;
  // String genre;
  // String year;
  // String description;
  ShowDetailPage(
      {super.key,
      required this.id,
      // required this.title,
      // required this.genre,
      // required this.year,
      // required this.description
      });

  @override
  State<ShowDetailPage> createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  ScrollController _scrollController = ScrollController();
  double scrollOffSet = 0.0;

  @override
  void initState() {
    @override
    void initState() {
      _scrollController = ScrollController()
        ..addListener(() {
          setState(() {
            scrollOffSet = _scrollController.offset;
          });
        });
      super.initState();
    }

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 70),
        child: CustomAppBar2(
          scrollOffSet: scrollOffSet,
        ),
      ),
      // AppBar(
      //   title: CustomAppBar2(),
      //   elevation: 0,
      //   // backgroundColor:Colors.black.withOpacity((scrollOffSet/350).clamp(0,1).toDouble()),
      // ),
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverToBoxAdapter(
          child: FutureBuilder(
              future: ShowByIdApiCall(widget.id),
              builder: (context, data) {
                if (data.hasData) {
                  var object = data.data as ShowById; //items[index].title
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.65,
                                // color: Colors.amber,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 30, 0, 0),
                                  child: DescWithMovies(
                                    id:'${object.show!.id}' ,
                                      title: object.show!.originalTitle!,
                                      year:
                                          '${object.show?.firstAired?.year}',
                                      genre: "Action",
                                      description: object.show!.overview!),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.65,
                                    decoration: BoxDecoration(
                                        // color: Colors.red,
                                        // gradient: LinearGradient(colors: [Colors.red,Colors.pink]),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                object.show!.backdropPath!),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.65,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    // color: Colors.amber,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.transparent
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.65,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Colors.black,
                                          Colors.transparent
                                        ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithRedBar(title: 'Available On'),
                            SizedBox(
                                height: 172,
                                width: MediaQuery.sizeOf(context).width,
                                // color: Colors.blue,
                                child: ListView.builder(
                                    // physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: object.show!.sources!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 130,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  // color: Colors.purple,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                           (streamService[
                                                              object
                                                              .show!
                                                              .sources![index]
                                                              .source] ==
                                                      null)
                                                  ? streamService["black"]!
                                                  : streamService[object.show!
                                                      .sources![index].source]!),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Gap(5),
                                            Text(object.show!.sources![index].displayName!),
                                          ],
                                        ),
                                      );
                                    })),
                          ],
                        ),
                        const Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWithRedBar(title: "Seasons"),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height * 0.35,
                              // color: Colors.pink,
                              child: ListView.builder(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: object.seasons!.length,
                                  itemBuilder: (context, index) {
                                    return CustomListViewTile2(
                                    
                                        imageUrl: object
                                            .seasons![index].episodes![0].thumbnailPath!,
                                        title:
                                            'Season ${object.seasons![index].season!}',
                                        year: '2024');
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else if (data.hasError) {
                  return Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: LottieBuilder.asset(
                                'assets/images/error_animation.json')
                                )
                            );
                } else {
                  return Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: LottieBuilder.asset(
                                'assets/images/loading_animation.json'
                                ),
                                )
                            );
                }
              }),
        ),
      ]),
    );
  }
}

// ignore: must_be_immutable
class CustomAppBar2 extends StatelessWidget {
  double scrollOffSet = 0.0;
  CustomAppBar2({super.key, required this.scrollOffSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color:
          Colors.black.withOpacity((scrollOffSet / 350).clamp(0, 1).toDouble()),
      child: const BackButton(),
    );
  }
}


// ignore: must_be_immutable
class CustomListViewTile2 extends StatelessWidget {
  String imageUrl;
  String title;
  String year;
  CustomListViewTile2(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125,
              width: 200,
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
            const Gap(10),
            Text(
              // object[index].title!,
              title,
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // Text(year), //'${object[index].releaseDate?.year}'
          ],
        ),
      ),
    );
  }
}
