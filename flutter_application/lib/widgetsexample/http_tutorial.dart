import 'package:flutter/material.dart';
import 'package:flutter_application/widgetsexample/set_time.dart';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  String result = 'Loading...';
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Europe', url: '/Africa/Nairobi');
    await instance.getData();
    setState(() {
      result = instance.time;
    });
  }

  @override
  void initState() {
    setUpWorldTime();
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
        children: [
          //Text('${response.body}')
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              result,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
