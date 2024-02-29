


import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies3/Mobile/Pages/HomePageMobile.dart';

import 'MoviesPageMobile.dart';
import 'ShowPageMobile.dart';

class NavBarMobile extends StatefulWidget {
  const NavBarMobile({super.key});

  @override
  State<NavBarMobile> createState() => _NavBarMobileState();
}

class _NavBarMobileState extends State<NavBarMobile> {
  int currentIndex=0;

  List<Widget> pages=[
    const HomePageMobile(),
    const MoviesPageMobile(),
    const ShowsPageMobile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 10,
            tabBackgroundColor:Colors.grey.shade900 ,
            color: Colors.white,
            backgroundColor: Colors.black,
            // selectedIndex: currentIndex,
            onTabChange: (value){
              setState(() {
                currentIndex=value;
              });
            },
            tabs:const [
              GButton(icon: Icons.home_rounded,text: 'Home',),
              GButton(icon: Icons.movie_creation_rounded,text: 'Movies',),
              GButton(icon: Icons.slideshow_rounded,text: 'Shows',),
            ] ,
            ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}