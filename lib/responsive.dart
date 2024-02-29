import 'package:flutter/material.dart';
import 'package:movies3/Desktop/Pages/HomePage.dart';
import 'package:movies3/Mobile/Pages/HomePageMobile.dart';
import 'package:movies3/Mobile/Pages/SplashScreen.dart';


class ResponsiveLayout extends StatelessWidget {
  Widget mobileBody;
  Widget desktopBody;
  ResponsiveLayout({super.key,required this.desktopBody,required this.mobileBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,constraints)
      {
        if(constraints.maxWidth > 600 )
        {
          return desktopBody;
          // return Container(color: Colors.amber,);
        }
        else
        {
          return mobileBody;
          // return Container(color: Colors.red,);
        }

      } 
      );
  }
}