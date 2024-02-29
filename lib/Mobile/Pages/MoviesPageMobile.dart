
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Models/MoviesModel.dart';
import '../Widget/CustomCachedImage.dart';
import 'MovieDetailMobile.dart';

class MoviesPageMobile extends StatefulWidget {
  const MoviesPageMobile({super.key});

  @override
  State<MoviesPageMobile> createState() => _MoviesPageMobileState();
}

class _MoviesPageMobileState extends State<MoviesPageMobile> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Movies',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w500),),
      ),
      body: Container(
        child: FutureBuilder(
          future: MoviesApiCall(), 
          builder: (context,data)
          {
            if(data.hasData)
            {
              var item = data.data as MoviesModel;
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: item.movies!.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.1,
                    mainAxisSpacing: 0.1,
                    mainAxisExtent: 267,
                  ),
                  itemBuilder:(contenxt,index)
                  {
                    return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailMobile(id:item.movies![index].id.toString())));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 170,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        width: 170,
                                        child: CustomCachedImage(imgUrl: item.movies![index].posterPath!,radius:10,),
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(10),
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(
                                        //           item.movies![index].posterPath!),
                                        //       fit: BoxFit.cover,
                                        //     )),
                                      ),
                                      const Gap(5),
                                      Text(item.movies![index].title!,overflow: TextOverflow.ellipsis,),
                                      const Gap(5),
                                      Text((item.movies![index].releaseDate==null)?"":item.movies![index].releaseDate!.year.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                  }
                ),
              );
            }
            else if(data.hasError)
            {
              return Center(
                            child: SizedBox(
                                height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                child: LottieBuilder.asset(
                                    'assets/images/error_animation.json')));
            }
            else
            {
              return SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: Center(
                              child: LottieBuilder.asset(
                                  'assets/images/Plane_Loading.json'),
                            ));
            }
          }
          ),
      ),
    );
  }
}