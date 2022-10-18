import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_application/widgetsexample/animationex.dart';
import 'package:flutter_application/widgetsexample/floating.dart';
import 'package:flutter_application/widgetsexample/full_example.dart';
import 'package:flutter_application/widgetsexample/scrolling.dart';
import 'package:flutter_application/widgetsexample/widget_3.dart';
import 'package:flutter_application/widgetsexample/widget_4.dart';
import 'widgetsexample/widget_one.dart';
import 'widgetsexample/widget_two.dart';

void main() {
  SystemUiOverlayStyle(systemNavigationBarColor: Colors.pink[400]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Myhommiepage(),
    );
  }
}

class Myhommiepage extends StatefulWidget {
  const Myhommiepage({super.key});

  @override
  State<Myhommiepage> createState() => _MyhommiepageState();
}

class _MyhommiepageState extends State<Myhommiepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is list of widgets inform of buttons"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Widgetone();
                          },
                        ),
                      );
                    });
                  },
                  child: const Text("Show dialog"),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Widgettwo();
                          },
                        ),
                      );
                    });
                  },
                  child: const Text('Aboutlist Tile'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const AbsorbPointerw();
                            },
                          ),
                        );
                      });
                    },
                    child: const Text('Absorb pointer'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const Showdialogw();
                            },
                          ),
                        );
                      });
                    },
                    child: const Text('Show Dialog'),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const FavoursPage();
                          },
                        ),
                      );
                    });
                  },
                  child: const Text('My to-do list'),
                ),
                const Text(
                  'Text widget',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //PopupMenuButton(itemBuilder: ((context) =>Showdialogw() ))
              ],
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Sample1();
                }));
              }),
              child: const Text('Samples'),
            ),
            const SizedBox(
              height: 50,
              width: 150,
              child: Center(
                child: Text(
                  'Sized box',
                  style: TextStyle(
                      backgroundColor: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.orange),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () => setState(() {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (BuildContext context) {
            //       return const FadeTest();
            //     }));
            //   }),
            //   child: const Text('Fade Test'),
            // ),
            ElevatedButton(
              onPressed: () => setState(() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const TabScrolling();
                }));
              }),
              child: const Text('Scrolling Demo'),
            )
          ],
        ),
      ),
    );
  }
}
