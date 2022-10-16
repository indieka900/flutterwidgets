import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Persondata {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}
