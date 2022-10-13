import 'package:flutter/material.dart';
import 'widgetsexample/widget_one.dart';
import 'widgetsexample/widget_two.dart';

void main() {
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
            Row(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
