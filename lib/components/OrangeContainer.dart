import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrangeContainer extends StatelessWidget {
  const OrangeContainer({required this.text}) : super();
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
        appBar: new AppBar(
          title: new Text(this.text),
        ),
        body: Center(
            child: Container(
              color: const Color(0xFFFF7F50),
              constraints: BoxConstraints(
                  maxHeight: 300.0,
                  maxWidth: 200.0,
                  minWidth: 150.0,
                  minHeight: 150.0
              ),
            )
        )
    );
  }
}