import 'package:flutter/material.dart';
import 'package:flutter_application/widgetsexample/set_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhttpexa extends StatefulWidget {
  const Myhttpexa({super.key});

  @override
  State<Myhttpexa> createState() => _MyhttpexaState();
}

class _MyhttpexaState extends State<Myhttpexa> {
  String result = 'Loading...';
  String locate = '';
  bool? timeD;
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
      timeD = instance.isDaytime;
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
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      timeD! ? 'images/nature.jpg' : 'images/nigh.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //if (result != 'Loading...')
                          Icon(
                            Icons.location_on,
                            color: timeD!
                                ? const Color.fromARGB(255, 15, 14, 14)
                                : const Color.fromARGB(255, 230, 231, 231),
                          ),
                          Text(
                            locate,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                //fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                                fontStyle: FontStyle.italic,
                                color: timeD!
                                    ? const Color.fromARGB(255, 5, 82, 5)
                                    : const Color.fromARGB(255, 148, 119, 119),
                                fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        result,
                        style: GoogleFonts.ubuntu(
                            //fontFamily: ,
                            fontSize: 50,
                            color: timeD!
                                ? Colors.black
                                : const Color.fromARGB(255, 94, 123, 202)
                            //fontStyle: FontStyle.italic,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
