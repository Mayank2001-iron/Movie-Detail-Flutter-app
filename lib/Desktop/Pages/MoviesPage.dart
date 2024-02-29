import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies3/Models/MoviesModel.dart';
import 'package:movies3/Models/showsModel.dart';
import '../Widgets/CustomListViewTile.dart';


class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies',style: GoogleFonts.poppins(fontSize: 30),),
      ),
      body: FutureBuilder(
        future: MoviesApiCall(), 
        builder: (context,data)
        {
          if(data.hasData)
          {
             var item = data.data as MoviesModel;
              return Container(
                child: GridView.builder(
                  itemCount: item.movies!.length,
                  gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    // mainAxisSpacing: 1,
                                    // crossAxisSpacing: 1,
                                    mainAxisExtent: 325),
                  itemBuilder: (context,index)
                  {
                    return CustomListViewTile(
                                id: item.movies![index].id.toString(),
                                  imageUrl:
                                      item.movies![index].posterPath!,
                                  title:item.movies![index].title.toString(),
                                  year:"",
                                  contentType: "movie",);
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
                            child: LottieBuilder.network(
                                'assets/images/error_animation.json')
                                )
                            );
          }
          else
          {
                return Center(
                        child: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            child: LottieBuilder.network(
                                'assets/images/loading_animation.json')
                                )
                            );
          }
        }
        )
    );
  }
}