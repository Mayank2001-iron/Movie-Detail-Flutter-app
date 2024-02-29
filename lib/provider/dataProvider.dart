import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/homeModel.dart';

class DataProvider {
  Future<List<HomeModel>> getData() async {
    try {
      var response = await http
          .get(Uri.parse('https://movies-api14.p.rapidapi.com/home'), headers: {
        
      });

      final list = jsonDecode(response.body) as List<dynamic>;
      return list.map((e) => HomeModel.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }

    // var items = list as List<HomeModel>;
    // return items;
  }
}
