import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies3/api_Bloc/api_bloc.dart';
import 'package:movies3/api_Bloc/api_event.dart';
import 'package:movies3/api_Bloc/api_state.dart';

import '../../Models/homeModel.dart';
import '../Widget/CustomAppBarMobile.dart';
import '../Widget/ListWithTitleMobile.dart';
import '../Widget/MainPosterMobile.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffSet = 0.0;

  Future<void> _handleRefresh() async {
    Future.delayed(const Duration(seconds: 2));
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<ApiBloc>().add(ApiLoadEvent());
        },
        child: Icon(Icons.refresh),
        ),
      backgroundColor: Colors.grey.shade900,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
        child: CustomAppBarMobile(
          scrollOffset: _scrollOffSet,
        ),
      ),
      body: BlocBuilder<ApiBloc,ApiState>(
        builder: (context, state) {  
          if(state is ApiErrorState)
          {
            return Center(
              child: Container(
                child: Text('Error'),
              ),
            );
          }
          else if(state is ApiSuccessState)
          {
          var items = state.homeModelList;
          return items.isNotEmpty?CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                              child:Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            MainPosterMobile(
                                              object: items[index].movies![1],
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
                                            ListWithTitleMobile(
                                              headTitle: items[index].title!,
                                              movieList: items[index].movies!,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
              ),
            ],
          ):Text("No data found");
          }
          else
          {
            return Center(child: Container(child: CircularProgressIndicator(),),);
          }
        },
      ),
    );
  }
}



// Column(
//               children: [
//                 MainPosterMobile(),
//                 ListWithTitleMobile(),
//                 MainPosterMobile(),
//                 ListWithTitleMobile(),
//                 MainPosterMobile(),
//                 ListWithTitleMobile(),
//               ],
//             ),


// FutureBuilder(
//               future: HMApiCall(),
//               builder: (context, data) 
//              {
//                   if (data.hasData) {
//                     var items =
//                         data.data as List<HomeModel>; //items[index].title
//                     return Column(
//                       children: [
//                         Container(
//                           height: MediaQuery.sizeOf(context).height,
//                           width: MediaQuery.sizeOf(context).width,
//                           child: ListView.builder(
//                               scrollDirection: Axis.vertical,
//                               itemCount: 10,
//                               itemBuilder: (context, index) {
//                                 return Column(
//                                   children: [
//                                     MainPosterMobile(
//                                       object: items[index].movies![1],
//                                       // id: '${items[index].movies![1].id}',
//                                       //   mainPosterString: items[index]
//                                       //       .movies![1]
//                                       //       .backdropPath!,
//                                       //   title: items[index].movies![1].title!,
//                                       //   genre:
//                                       //       '${items[index].movies![1].genres![0].name.characters}',
//                                       //   description: items[index]
//                                       //       .movies![1]
//                                       //       .overview!,
//                                       //   year: "",
//                                     ),
//                                     ListWithTitleMobile(
//                                       headTitle: items[index].title!,
//                                       movieList: items[index].movies!,
//                                     ),
//                                   ],
//                                 );
//                               }),
//                         ),
//                       ],
//                     );
//                   } else if (data.hasError) {
//                     return Center(
//                         child: Container(
//                             height: MediaQuery.sizeOf(context).height,
//                             width: MediaQuery.sizeOf(context).width,
//                             child: LottieBuilder.network(
//                                 'assets/images/error_animation.json')
//                                 )
//                             );
//                   } else {
//                     return Center(
//                         child: Container(
//                             height: MediaQuery.sizeOf(context).height,
//                             width: MediaQuery.sizeOf(context).width,
//                             child: LottieBuilder.network(
//                                 'assets/images/loading_animation.json')
//                                 )
//                             );
//                   }
//                 }

//             ),
