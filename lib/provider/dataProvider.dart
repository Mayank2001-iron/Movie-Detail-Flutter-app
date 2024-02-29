import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/homeModel.dart';

class DataProvider {
  Future<List<HomeModel>> getData() async {
    try {
      var response = await http
          .get(Uri.parse('https://movies-api14.p.rapidapi.com/home'), headers: {
        'X-RapidAPI-Key': '468f91dc8amshf41865004d75b0ap1a384fjsnf2ae337d8f13',
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
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
