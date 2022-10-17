import 'package:flutter/material.dart';
import 'package:flutter_application/widgetsexample/set_time.dart';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  void setUpWorldTime() {
    WorldTime instance = WorldTime(location: 'Nairobi', url: '/Africa/Nairobi');
    instance.getData();
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
        children: const [
          //Text('${response.body}')
          //Text(item),
        ],
      ),
    );
  }
}
