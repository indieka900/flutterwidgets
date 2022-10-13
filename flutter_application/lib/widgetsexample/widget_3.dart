import 'package:flutter/material.dart';

class AbsorbPointerw extends StatefulWidget {
  const AbsorbPointerw({super.key});

  @override
  State<AbsorbPointerw> createState() => _AbsorbPointerwState();
}

class _AbsorbPointerwState extends State<AbsorbPointerw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absorption Widget'),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 100,
              child: ElevatedButton(
                onPressed: () {},
                child: null,
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 200,
              child: AbsorbPointer(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700]),
                  onPressed: () {},
                  child: const Text("Absorb pointer button"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
