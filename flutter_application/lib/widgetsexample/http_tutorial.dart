import 'package:flutter/material.dart';
import 'package:flutter_application/widgetsexample/set_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  String result = 'Loading...';
  String locate = '';
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Nairobi', url: '/Africa/Nairobi');
    await instance.getData();
    // ignore: use_build_context_synchronously
    // Navigator.of(context).pushReplacement(result: instance,
    //   MaterialPageRoute(builder: (BuildContext context) {
    //     return const Showdialogw();
    //   }, ),
    // );
    setState(() {
      result = instance.time;
      locate = instance.location;
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
      body: result == 'Loading...'
          ? const Center(
              child: SpinKitFadingCircle(
                color: Color.fromARGB(255, 26, 1, 1),
                size: 50.0,
              ),
              // child: SpinKitThreeInOut(
              //   itemBuilder: (BuildContext context, int index) {
              //     return DecoratedBox(
              //       decoration: BoxDecoration(
              //         color: index.isEven ? Colors.red : Colors.green,
              //       ),
              //       //child: const Text('Loading'),
              //     );
              //   },
              // ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (result != 'Loading...')
                          const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 139, 139, 139),
                          ),
                        Text(
                          locate,
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              //fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 15, 128, 148),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      result,
                      style: const TextStyle(
                        fontSize: 50,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
