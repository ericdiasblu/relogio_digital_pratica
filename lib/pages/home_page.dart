import 'dart:async';

import 'package:flutter/material.dart';
import 'package:relogio_digital/builders/stream_notifier_builder.dart';
import 'package:relogio_digital/controllers/stream_notifier_imp.dart';
import 'package:relogio_digital/widgets/buildBook.dart';
import 'package:relogio_digital/widgets/buildClock.dart';
import 'package:relogio_digital/widgets/buildShelf.dart';
import 'package:relogio_digital/widgets/buildWindow.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final StreamNotifier<DateTime> clockNotifier;
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    clockNotifier = StreamNotifier<DateTime>(DateTime.now());

    // Atualiza a cada segundo
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      clockNotifier.emit(DateTime.now());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    clockNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            buildWindow(),
            SizedBox(height: 10),
            buildEstante(),
            buildClock(clockNotifier: clockNotifier),
            buildEstante(),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      buildBook(
                        primaryColor: Colors.blueAccent,
                        secondaryColor: Colors.yellow,
                      ),
                      buildBook(
                        primaryColor: Colors.green,
                        secondaryColor: Colors.orange,
                      ),
                      buildBook(
                        primaryColor: Colors.purple,
                        secondaryColor: Colors.pink,
                      ),
                      buildBook(
                        primaryColor: const Color.fromARGB(255, 226, 63, 4),
                        secondaryColor: const Color.fromARGB(255, 209, 6, 125),
                      ),
                    ],
                  ),
                  buildEstante(height: 200),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
