import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  getData() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
    Map data = jsonDecode(response.body);
    //print(data['datetime']);
    return data;

    //print(data['id']);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future item = getData();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HTTP Request'),
      // ),
      backgroundColor: const Color.fromARGB(255, 240, 213, 116),
      body: Column(
        children: const [
          //Text('${response.body}')
          //Text(item),
        ],
      ),
    );
  }
}
