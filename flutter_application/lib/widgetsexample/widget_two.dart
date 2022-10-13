import 'package:flutter/material.dart';

class Widgettwo extends StatelessWidget {
  const Widgettwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About List Tile"),
        //centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: const Center(
        child: AboutListTile(
            icon: Icon(Icons.info),
            applicationIcon: FlutterLogo(),
            applicationLegalese: 'Legalese',
            applicationName: 'Joseph\'s Flutter App',
            applicationVersion: 'version1.0.5',
            aboutBoxChildren: [
              Text("Joseph Indieka"),
            ]),
      ),
    );
  }
}
