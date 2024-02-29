import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTitlePageButton extends StatelessWidget {
  String text;
  Color color;
  CustomTitlePageButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
        child: Text(text),
      ),
    );
  }
}