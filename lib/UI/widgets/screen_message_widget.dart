import 'package:flutter/material.dart';

class ScreenMessageWidget extends StatelessWidget {
  ScreenMessageWidget({@required this.massage});
  final massage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(massage,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white70),
            textAlign: TextAlign.center),
      ),
    );
  }
}
