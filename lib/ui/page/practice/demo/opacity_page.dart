import 'package:flutter/material.dart';

class OpacityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Center(
          child: Opacity(
            opacity: 1,
            child: Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(20.0),
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}