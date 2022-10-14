import 'package:flutter/material.dart';

class Showdialogw extends StatelessWidget {
  const Showdialogw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show alert dialog widget'),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              animationDuration: const Duration(seconds: 2),
              elevation: 2),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Go Back'),
                        )
                      ],
                      title: const Text('Flutter Tutorial'),
                      contentPadding: const EdgeInsets.all(22),
                      content: const Text('This is the alert dialog'),
                    ));
          },
          child: const Text('Show dialog message'),
        ),
      ),
    );
  }
}
