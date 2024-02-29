
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies3/Models/homeModel.dart';

import '../Pages/MovieDetailMobile.dart';
import '../Pages/ShowDetailMobile.dart';
import 'CustomCachedImage.dart';

class MainPosterMobile extends StatelessWidget {
  Movie object;
  MainPosterMobile({super.key, required this.object});
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
            SizedBox(
              // color: Colors.purple,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.4,
              // decoration: BoxDecoration(
              //     // color: Colors.purple,
              //     borderRadius: BorderRadius.circular(radius),
              //     image: DecorationImage(
              //         image: NetworkImage(object.backdropPath!),
              //         fit: BoxFit.cover)
              //         ),
              child: CustomCachedImage(imgUrl:object.backdropPath!,radius:radius),
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
                    Text((object.releaseDate == null)
                        ? ""
                        : object.releaseDate!.year.toString()),
                    const Gap(10),
                    GestureDetector(
                      onTap: () {
                        if (object.contentType == "movie") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailMobile(
                                      id: object.id.toString())));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowDetailMobile(
                                      id: object.id.toString())));
                        }
                      },
                      child: Container(
                        width: 110,
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 223, 22, 8),
                          borderRadius: BorderRadius.circular(radius),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(4, 4),
                              blurRadius: 5,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Text('Details'),
                            Gap(5),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
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
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(radius),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                        blurRadius: 5,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
