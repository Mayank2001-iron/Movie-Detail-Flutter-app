


// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithBarMobile extends StatelessWidget {
  String title;
  TextWithBarMobile({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(0),
            // padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.amber,
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 228, 20, 5),
                  height: 3,
                  width: 50,
                ),
              ],
            ),
          );
  }
}