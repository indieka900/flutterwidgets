import 'package:flutter/material.dart';

class Showdialogw extends StatefulWidget {
  const Showdialogw({super.key});

  @override
  State<Showdialogw> createState() => _ShowdialogwState();
}

class _ShowdialogwState extends State<Showdialogw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show alert dialog widget'),
      ),
      body: Center(
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  animationDuration: const Duration(seconds: 2),
                  elevation: 2),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          title: const Text('Flutter Tutorial'),
                          contentPadding: const EdgeInsets.all(22),
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Go Back'),
                            )
                          ],
                          //content: const Text('This is the alert dialog'),
                        ));
              },
              child: const Text('Show dialog message'),
            ),
            // GestureDetector(
            //   onLongPress: () {
            //     setState(() {
            //       const Text('Long pressed');
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
