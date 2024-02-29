import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies3/Desktop/Pages/HomePage.dart';
import 'package:movies3/Desktop/Pages/MoviesPage.dart';
import 'package:movies3/Desktop/Pages/ShowsPage.dart';
import 'package:movies3/Mobile/Pages/NavBarMobile.dart';
import 'package:movies3/Mobile/Pages/SplashScreen.dart';
import 'package:movies3/UserBloc/User_Bloc.dart';
import 'package:movies3/api_Bloc/api_bloc.dart';
import 'package:movies3/provider/dataProvider.dart';
import 'package:movies3/repository/user_repository.dart';
import 'firebase_options.dart';
import 'responsive.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create:(context)=>ApiBloc(userRepository: UserRepository(dataProvider: DataProvider())),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: ResponsiveLayout(
          mobileBody: SplashScreen(),
          desktopBody: HomePage(),
        ),
      ),
    );
  }
}
