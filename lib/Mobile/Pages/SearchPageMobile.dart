
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Desktop/Widgets/TextWithRedBar.dart';
import '../../Models/searchModel.dart';
import '../Widget/CustomCachedImage.dart';
import 'MovieDetailMobile.dart';
import 'ShowDetailMobile.dart';

class SearchPageMobile extends StatefulWidget {
  String query;
  SearchPageMobile({super.key,required this.query});

  @override
  State<SearchPageMobile> createState() => _SearchPageMobileState();
}

class _SearchPageMobileState extends State<SearchPageMobile> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.amber,
          toolbarHeight: 70,
          title: SizedBox(
            width: 270,
            child: TextField(
              controller: textController,
              onSubmitted: (value) {
                setState(() {
                  widget.query = value;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.close),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.grey.shade800,
                  filled: true),
            ),
          ),
        ),
        body: FutureBuilder(
          future: SearchCallApi(widget.query),
          builder: (context, data) {
            if (data.hasData) {
              var item = data.data as SearchModel;
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: TextWithRedBar(title: 'Result')),
                    Expanded(
                      flex: 10,
                      child: Container(
                        // color: Colors.amber,
                        child: GridView.builder(
                            itemCount: item.contents!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.1,
                              mainAxisSpacing: 0.1,
                              mainAxisExtent: 267,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if(item.contents![index].contentType=='movie') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailMobile(id: item.contents![index].id.toString())));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShowDetailMobile(id: item.contents![index].id.toString())));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 170,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          width: 170,
                                          child: CustomCachedImage(imgUrl: item
                                                    .contents![index]
                                                    .posterPath!,radius: 10,),
                                          // decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     image: DecorationImage(
                                          //       image: NetworkImage(item
                                          //           .contents![index]
                                          //           .posterPath!),
                                          //       fit: BoxFit.cover,
                                          //     )),
                                        ),
                                        const Gap(5),
                                        Text(
                                          item.contents![index].title!,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Gap(5),
                                        Text((item.contents![index].releaseDate==null)?"":item.contents![index].releaseDate!.year.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
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
          },
        ));
  }
}
