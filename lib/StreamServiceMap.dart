
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String,String> streamService = {
  "hbo_max":"assets/images/hbo_max (1).png",
  "netflix":"assets/images/netflix (1).png",
  "apple_tv":"assets/images/apple_tv (1).png",
  "vudu":"assets/images/vudu (1).png",
  "black":"assets/images/Stream_default2.png"
};


Future<void> launchMyUrl(String url,BuildContext context) async {
  Uri link = Uri.parse(url);
  if (await canLaunchUrl(link)) {
    await launchUrl(link);
  }
  else
  {
      const snackdemo = SnackBar(
            content: Text('Hii this is GFG\'s SnackBar'),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      // final snackBar = SnackBar(
      //             /// need to set following properties for best effect of awesome_snackbar_content
      //             elevation: 0,
      //             behavior: SnackBarBehavior.floating,
      //             backgroundColor: Colors.transparent,
      //             duration: const Duration(seconds: 2),
      //             content: AwesomeSnackbarContent(
      //               title: 'Error',
      //               message:
      //                   'Could not launch Url',

      //               /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      //               contentType: ContentType.failure,
      //             ),
      //           );

      //           ScaffoldMessenger.of(context)
      //             ..hideCurrentSnackBar()
      //             ..showSnackBar(snackBar);
  }
}

