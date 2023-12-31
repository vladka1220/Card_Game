import 'package:flutter/material.dart';

import 'start_page/start_page.dart';

void main() {
  runApp(const PlayCard());
}

class PlayCard extends StatelessWidget {
  const PlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //убрать Debug
      title: 'Play Card',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 162, 164),
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade500),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}
