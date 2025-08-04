import 'dart:async';

import 'package:flutter/material.dart';
import 'package:relogio_digital/builders/stream_notifier_builder.dart';
import 'package:relogio_digital/controllers/stream_notifier_imp.dart';

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
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2),
              ),
              width: 250,
              height: 70,
              child: Center(
                child: StreamNotifierBuilder<DateTime>(
                  streamNotifier: clockNotifier,
                  builder: (context, dateTime) {
                    return Text(
                      '${dateTime.hour.toString().padLeft(2, '0')}:'
                      '${dateTime.minute.toString().padLeft(2, '0')}:'
                      '${dateTime.second.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                  // Opcional: só reconstrói se mudou o segundo
                  buildWhen:
                      (previous, current) => previous.second != current.second,
                  // Opcional: log quando muda
                  listen: (context, dateTime) {
                    print('Horário atualizado: $dateTime');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 92, 63, 51),
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blueAccent,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        width: 20,
                        height: 80,
                      ),
                      Container(
                        width: 20,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 92, 63, 51),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
