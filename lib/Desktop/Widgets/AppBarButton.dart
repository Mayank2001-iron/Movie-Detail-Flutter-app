import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarButton extends StatelessWidget {
  String text;
  Widget wpage;
  AppBarButton({super.key, required this.text,required this.wpage});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>wpage));
             },
      child: Text(text),
    );
  }
}