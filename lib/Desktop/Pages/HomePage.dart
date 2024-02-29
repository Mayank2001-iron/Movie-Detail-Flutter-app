import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Models/homeModel.dart';
import '../Widgets/CustomAppBar.dart';
import '../Widgets/EndOfSite.dart';
import '../Widgets/ListOfMoviesWidget.dart';
import '../Widgets/MainPoster.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffSet = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffSet = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 70),
        child: CustomAppBar(
          scrollOffset: _scrollOffSet,
        ),
      ),
      //  AppBar(

      //   toolbarHeight: 70,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: CustomAppBar(
      //     scrollOffset: _scrollOffSet,
      //   ),
      // ),

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: FutureBuilder(
                future: HMApiCall(),
                builder: (context, data) {
                  if (data.hasData) {
                    var items =
                        data.data as List<HomeModel>; //items[index].title
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    MainPosterPage(
                                      movieObject: items[index].movies![1],
                                      // id: '${items[index].movies![1].id}',
                                      //   mainPosterString: items[index]
                                      //       .movies![1]
                                      //       .backdropPath!,
                                      //   title: items[index].movies![1].title!,
                                      //   genre:
                                      //       '${items[index].movies![1].genres![0].name.characters}',
                                      //   description: items[index]
                                      //       .movies![1]
                                      //       .overview!,
                                      //   year: "",
                                    ),
                                    ListofMoviesWithTitle(
                                      headTitle: items[index].title!,
                                      object: items[index].movies!,
                                    ),
                                  ],
                                );
                              }),
                        ),
                        const EndOfSite()
                      ],
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
                                'assets/images/loading_animation.json')
                                )
                            );
                  }
                }),
            // child: Column(
            //   children: [
            //     MainPosterPage(),
            //     ListofMoviesWithTitle(),
            //     MainPosterPage(),
            //     ListofMoviesWithTitle(),
            //     MainPosterPage(),
            //     ListofMoviesWithTitle(),
            //     MainPosterPage(),
            //     ListofMoviesWithTitle(),
            //     EndOfSite(),
            // ],
          ),
        ],
      ),
    );
  }
}

// FutureBuilder(
//     future: HMApiCall(),
//     builder: (context, data) {
//       if (data.hasData) {
//         var items = data.data as List<HomeModel>;     //items[index].title
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               // CustomAppBar(),
//               Container(
//                 height: MediaQuery.sizeOf(context).height,
//                 width: MediaQuery.sizeOf(context).width,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: items.length,
//                   itemBuilder:(context,index)
//                   {
//                     return Column(
//                     children: [
//                       MainPosterPage(mainPosterString: items[index].movies![0].backdropPath!, title: items[index].movies![0].title!, genre: '${items[index].movies![0].genres![0].name.characters}/${items[index].movies![0].genres![1].name}/${items[index].movies![0].genres![2].name}', description: items[index].movies![0].overview!),
//                       ListofMoviesWithTitle(headTitle: items[index].title!,object: items[index].movies!,),
//                     ],
//                   );

//                   }

//                 ),
//               ),
//             ],
//           ),
//         );
//       } else if (data.hasError) {
//         return Center(
//           child: Text('Error'),
//         );
//       } else {
//         return Center(CircularProgressIndicator());
//       }
//     }),

//  SingleChildScrollView(
//   child: Container(
//     color: Colors.black,
//     child: Column(
//       children: [
//         MainPosterPage(
//           mainPosterString: 'assets/images/background.jpg',
//           title: 'Batman',
//           genre: 'Action/Drama',
//           description:
//               'Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth.',
//         ),
//         // Stack for Front Page is Over
//         //Trending Movies
//        ListofMoviesWithTitle(title: 'Trending Movies',),
//        MainPosterPage(
//           mainPosterString: 'assets/images/background.jpg',
//           title: 'Batman',
//           genre: 'Action/Drama',
//           description:
//               'Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth.',
//         ),
//         //Trending Movies

//         // Stack for Front Page is Over
//         //Trending Movies
//        ListofMoviesWithTitle(title: 'Trending Movies',),
//         MainPosterPage(
//           mainPosterString: 'assets/images/background.jpg',
//           title: 'Batman',
//           genre: 'Action/Drama',
//           description:
//               'Batman was originally introduced as a ruthless vigilante who frequently killed or maimed criminals, but evolved into a character with a stringent moral code and strong sense of justice. Unlike most superheroes, Batman does not possess any superpowers, instead relying on his intellect, fighting skills, and wealth.',
//         ),
//          ListofMoviesWithTitle(title: 'Trending Movies',),
//         // Stack for Front Page is Over
//         //Trending Movies

//         //Trending Movies

//         // Stack for Front Page is Over
//         //Trending Movies

//         // Stack for Front Page is Over
//         //Trending Movies

//         // Stack for Front Page is Over
//         //Trending Movies

//        EndOfSite(),

//       ],
//     ),
//   ),
// )

// FutureBuilder(
//             future: HMApiCall(),
//             builder: (context, data) {
//               if (data.hasData) {
//                 var items = data.data as List<HomeModel>;
//                 return ListView.builder(
//                     itemCount: items.length,
//                     itemBuilder: (context, index) {
//                       print(index);
//                       return Text("${items[index].title}");
//                     });
//               } else if (data.hasError) {
//                 return Center(
//                   child: Text('Error'),
//                 );
//               } else {
//                 return CircularProgressIndicator();
//               }
//             })






// FutureBuilder(
//                 future: HMApiCall(),
//                 builder: (context, data) {
//                   if (data.hasData) {
//                     var items =
//                         data.data as List<HomeModel>; //items[index].title
//                     return SingleChildScrollView(
//                       child:Column(
//                         children: [
//                           Container(
//                                 height: MediaQuery.sizeOf(context).height,
//                                 width: MediaQuery.sizeOf(context).width,
//                                 child: ListView.builder(
//                                     scrollDirection: Axis.vertical,
//                                     itemCount: 10,
//                                     itemBuilder: (context, index) {
//                                       return Column(
//                                         children: [
//                                           MainPosterPage(
//                                               mainPosterString: items[index]
//                                                   .movies![1]
//                                                   .backdropPath!,
//                                               title: items[index].movies![1].title!,
//                                               genre:
//                                                   '${items[index].movies![1].genres![0].name.characters}',
//                                               description: items[index]
//                                                   .movies![1]
//                                                   .overview!),
//                                           ListofMoviesWithTitle(
//                                             headTitle: items[index].title!,
//                                             object: items[index].movies!,
//                                           ),
//                                         ],
//                                       );
//                                     }),
//                               ),
//                               EndOfSite()
//                         ],
//                       ),
//                     );
//                   } else if (data.hasError) {
//                     return Center(
//                       child: Text('Error'),
//                     );
//                   } else {
//                     return Center(child:CircularProgressIndicator());
//                   }
//                 }),