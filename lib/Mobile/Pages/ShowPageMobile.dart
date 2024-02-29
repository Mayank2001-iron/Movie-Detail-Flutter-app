
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Models/showsModel.dart';
import '../Widget/CustomCachedImage.dart';
import 'ShowDetailMobile.dart';

class ShowsPageMobile extends StatefulWidget {
  const ShowsPageMobile({super.key});

  @override
  State<ShowsPageMobile> createState() => _ShowsPageMobileState();
}

class _ShowsPageMobileState extends State<ShowsPageMobile> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shows',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w500),),
      ),
      body: Container(
        child: FutureBuilder(
          future: ShowsApiCall(), 
          builder: (context,data)
          {
            if(data.hasData)
            {
              var item = data.data as ShowsModel;
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDetailMobile(id:item.movies![index].id.toString())));
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
                                        child: CustomCachedImage(imgUrl: item.movies![index].posterPath! ,radius: 10,),
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
                                      Text((item.movies![index].firstAired==null)?"":item.movies![index].firstAired!.year.toString()),
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