// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String time = '';
  String url;
  WorldTime({
    required this.location,
    required this.url,
  });

  Future<void> getData() async {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone$url'));
    Map data = jsonDecode(response.body);
    //print(data['datetime']);
    //print(data['id']);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }
}
