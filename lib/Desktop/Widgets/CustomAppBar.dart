


// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies3/Desktop/Pages/HomePage.dart';
import 'package:movies3/Desktop/Pages/MoviesPage.dart';
import 'package:movies3/Desktop/Widgets/AppBarButton.dart';

import '../../Models/history.dart';
import '../Pages/SearchPage.dart';
import '../Pages/ShowsPage.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  CustomAppBar({super.key,this.scrollOffset=0.0});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Netflix Logo and Buttons
          Row(
            children: [
              //Netflix Logo
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Image(
                  image: AssetImage('assets/images/Netflix_Logo_RGB.png'),
                  height: 45,
                ),
              ),
              // Buttons
              AppBarButton(text: "Home",wpage: HomePage(),),
              AppBarButton(text: "TV Shows",wpage: ShowsPage(),),
              AppBarButton(text: "Movies",wpage: MoviesPage(),),
              AppBarButton(text: "Series",wpage: ShowsPage(),),
              AppBarButton(text: "Latest",wpage: HomePage(),),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                        onSubmitted: (value) {
                          history.add(value);
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchPage(query: value)));
                          textController.text="";
                        },
                        controller: textController,
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: const Icon(Icons.search),
                            fillColor: Colors.grey.shade800,
                            filled: true),
                      ),
            ),
          ),

          // Search Button and User
          Row(
            children: [
              // Search Button
              // GestureDetector(
              //   onTap: (){
              //     Get.to(SearchPage(query: 'Breaking bad'));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              //   ),
              // ),

              // User
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                  Text('User Name'),
                  const Gap(50),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
