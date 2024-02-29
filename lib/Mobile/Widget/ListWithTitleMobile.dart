
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies3/Mobile/Widget/TextWithbarMobile.dart';

import '../../Models/homeModel.dart';
import '../Pages/MovieDetailMobile.dart';
import '../Pages/ShowDetailMobile.dart';
import 'CustomCachedImage.dart';

class ListWithTitleMobile extends StatelessWidget {
  String headTitle;
  List<Movie> movieList;
  ListWithTitleMobile({super.key,required this.headTitle,required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: TextWithBarMobile(title: headTitle),
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
                          itemCount: movieList.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                if(movieList[index].contentType=="movie") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailMobile(id:movieList[index].id.toString())));
                                } else {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetailMobile(id:movieList[index].id.toString())));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 193,
                                        width: 150,
                                        child: CustomCachedImage(imgUrl: movieList[index].posterPath!,radius: 10,)
                                      ),
                                      const Gap(5),
                                      Text(movieList[index].title!,overflow: TextOverflow.ellipsis,),
                                      const Gap(5),
                                      Text((movieList[index].releaseDate==null)?"":movieList[index].releaseDate!.year.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                    ),
                  ],
                );
  }
}