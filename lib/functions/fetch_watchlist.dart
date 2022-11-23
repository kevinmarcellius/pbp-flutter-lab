import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/mywatchlist.dart';

Future<List<MyWatchlist>> fetchWatchlist() async {
  var url =
      Uri.parse('https://pbp-tugas02-kevin.herokuapp.com/mywatchlist/json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<MyWatchlist> listMyWatchlist = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchlist.add(MyWatchlist.fromJson(d));
    }
  }

  return listMyWatchlist;
}
