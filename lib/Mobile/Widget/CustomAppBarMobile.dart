
// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../Pages/SearchPageMobile.dart';

// ignore: must_be_immutable
class CustomAppBarMobile extends StatelessWidget {
  double scrollOffset;
  CustomAppBarMobile({super.key,this.scrollOffset=0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.black.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
        Image.asset('assets/images/Netflix_Logo_RGB.png'),
        Text('0'),
        Text('0'),
        MaterialButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPageMobile(query: "breaking bad")));
        },
        child: const Icon(Icons.search),
        )

        ]
      ),
    );
  }
}