import 'package:flutter/material.dart';

class Sample1 extends StatefulWidget {
  const Sample1({super.key});

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  bool toggle = true;
  String txt1 = 'Toggle Two';
  String txt2 = 'Press the floating on to change';
  String txt = 'Hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Text('Murife'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: toggle
            ? const Text(
                'Toggle One',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    // if (txt != txt1) {
                    //   txt = txt1;
                    // } else {
                    //   txt = txt2;
                    // }
                    txt != txt1 ? txt = txt1 : txt = txt2;
                  });
                },
                child: Text(txt),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        tooltip: 'Update text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
