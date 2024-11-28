import 'package:flutter/material.dart';
import 'dart:async';

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  addError() {
    controller.sink.addError('error');
  }

  void addNumber(int newNumber) {
    controller.sink.add(newNumber);
  }

  close() {
    controller.close();
  }
}

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.yellow,
    Colors.cyan,
    Colors.brown,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % colors.length;
        return colors[index];
      },
    );
  }
}
