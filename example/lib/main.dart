import 'package:flutter/material.dart';
import 'dart:async';

import 'package:constellation_dart/constellation_dart.dart'
    as constellation_dart;
import 'package:flutter/src/gestures/events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  GlobalKey key = GlobalKey();

  bool started = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Constellation'),
          ),
          body: Column(
            children: [
              TextButton(
                  onPressed: () {
                    started = true;
                    constellation_dart.main();
                  },
                  child: Text("Start")),
              TextButton(
                  onPressed: () {
                    constellation_dart.setWindow(0x106000f8);
                    constellation_dart.createCursor(
                        "id_1", "Hello from flutter!");
                    constellation_dart.setCursorColor("id_1", Colors.amber);
                  },
                  child: Text("Create Cursor")),
              Center(
                child: SizedBox(
                  width: 1280,
                  height: 720,
                  child: LayoutBuilder(
                    builder: (context, constraints) => MouseRegion(
                      onHover: (e) => onMouseHover(e, constraints),
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void onMouseHover(PointerHoverEvent event, BoxConstraints constraints) {
    if (!started) {
      return;
    }

    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final dx = event.localPosition.dx;
    final dy = event.localPosition.dy;
    final x = dx / width;
    final y = dy / height;

    constellation_dart.setCursorPosition("id_1", x, y);
  }
}
