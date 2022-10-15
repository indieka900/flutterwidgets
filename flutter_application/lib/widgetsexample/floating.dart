import 'package:flutter/material.dart';

class Sample1 extends StatefulWidget {
  const Sample1({super.key});

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: const Text('Murife'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: toggle
            ? const Text('Toggle One')
            : ElevatedButton(
                onPressed: () {},
                child: const Text('Toggle Two'),
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
