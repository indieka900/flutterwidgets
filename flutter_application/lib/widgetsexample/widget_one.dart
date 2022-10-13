import 'package:flutter/material.dart';

class Widgetone extends StatelessWidget {
  const Widgetone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShowDialog Widget"),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AboutDialog(
                    applicationIcon: FlutterLogo(),
                    applicationLegalese: 'Legalese',
                    applicationName: 'Joseph\'s Flutter App',
                    applicationVersion: 'version1.0.5',
                    children: [
                      Text("This details were created by Joseph580"),
                    ],
                  ),
                );
              },
              child: const Text("showApp info"),
            ),
          ],
        ),
      ),
    );
  }
}
