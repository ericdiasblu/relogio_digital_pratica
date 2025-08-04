import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relogio_digital/builders/stream_notifier_builder.dart';
import 'package:relogio_digital/controllers/stream_notifier_imp.dart';

Widget buildClock({required StreamNotifier<DateTime> clockNotifier}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 19, 18, 18),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color.fromARGB(255, 34, 34, 34),
        width: 2,
      ),
    ),
    width: 120,
    height: 60,
    child: Center(
      child: StreamNotifierBuilder<DateTime>(
        streamNotifier: clockNotifier,
        builder: (context, dateTime) {
          return Text(
            '${dateTime.hour.toString().padLeft(2, '0')}:'
            '${dateTime.minute.toString().padLeft(2, '0')}:'
            '${dateTime.second.toString().padLeft(2, '0')}',
            style: GoogleFonts.orbitron(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          );
        },
        // Opcional: só reconstrói se mudou o segundo
        buildWhen: (previous, current) => previous.second != current.second,
        // Opcional: log quando muda
        listen: (context, dateTime) {
          print('Horário atualizado: $dateTime');
        },
      ),
    ),
  );
}
