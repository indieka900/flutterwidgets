// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String url;
  WorldTime({
    required this.location,
    required this.url,
  });

  Future<void> getData() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone$url'));
      Map data = jsonDecode(response.body);
      //print(data['datetime']);
      //print(data['id']);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      String formatted = DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
      time = 'The time in $location is $formatted';
    } catch (e) {
      time = 'Time not found check the url';
    }
  }
}
