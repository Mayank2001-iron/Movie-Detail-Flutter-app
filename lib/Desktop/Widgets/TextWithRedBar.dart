import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



// ignore: must_be_immutable
class TextWithRedBar extends StatelessWidget {
  String title;
  TextWithRedBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.fromLTRB(40, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w500),
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