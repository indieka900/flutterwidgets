import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  
  @override
  void initState() {
    //getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Future item = getData();
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
