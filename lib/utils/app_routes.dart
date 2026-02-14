import 'package:flutter/material.dart';

Route smoothRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 350),
    pageBuilder: (_, _, _) => page,
    transitionsBuilder: (_, animation, _, child) {
      return FadeTransition(
        opacity: animation,
          child: child,
        );
      
    },
  );
}
