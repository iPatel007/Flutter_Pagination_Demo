import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static SizedBox verticalSpace(double size) {
    return SizedBox(height: size);
  }

  static SizedBox horizontalSpace(double size) {
    return SizedBox(width: size);
  }

  static loaderWidget({double size = 40, Color color = Colors.cyanAccent}) {
    return Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color)),
        ));
  }

}
