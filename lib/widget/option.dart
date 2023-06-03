import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  String text;
  Option({super.key, required this.text});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 212, 226, 212),
          borderRadius: BorderRadius.circular(12)),
      child: Text(widget.text),
    );
  }
}
