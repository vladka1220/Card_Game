import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  final List<Map<String, dynamic>> categories = [
    {'title': 'Домашние приборы', 'image': 'assets/png/4.png'},
    {'title': 'Цвета', 'image': 'assets/png/cor.png'},
    {'title': 'Машины', 'image': 'assets/png/car.png'},
    {'title': 'Дикие животные', 'image': 'assets/png/5.png'},
    {'title': 'Музыкальные инструменты', 'image': 'assets/png/4.png'},
    {'title': 'Природа', 'image': 'assets/png/2.png'},
    {'title': 'Домашние животные', 'image': 'assets/png/3.png'},
    {'title': 'Птицы', 'image': 'assets/png/1.png'},
    // Добавьте остальные категории здесь
  ];

  void onCategoryTap(String category) {
    // Logic for category tap
  }

  @override
  void initState() {
    super.initState();
  }

  // void playMusic() async {
  //   try {
  //     String audioPath = 'assets/audio/my_audio.mp3';
  //     int result = await audioPlayer.play(audioPath, isLocal: true);
  //     print("playMusic: Result = $result"); // Логирование результата

  //     if (result == 1) {
  //       setState(() {
  //         isPlaying = true;
  //         print("Music started playing"); // Логирование начала воспроизведения
  //       });
  //     }
  //   } catch (e) {
  //     print("Error in playMusic: $e"); // Логирование ошибки
  //   }
  // }

  // void toggleMusic() async {
  //   try {
  //     if (isPlaying) {
  //       await audioPlayer.pause();
  //       print("Music paused"); // Логирование паузы
  //     } else {
  //       int result = await audioPlayer.play('assets/audio/my_audio.mp3', isLocal: true);
  //       print("Music resumed/started: Result = $result"); // Логирование возобновления/начала воспроизведения
  //     }
  //     setState(() {
  //       isPlaying = !isPlaying;
  //     });
  //   } catch (e) {
  //     print("Error in toggleMusic: $e"); // Логирование ошибки
  //   }
  // }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context); // Возвращает пользователя на StartPage
        },
      ),
        // actions: [
        //   IconButton(
        //     icon: Icon(isPlaying ? Icons.volume_off : Icons.volume_up),
        //     onPressed: toggleMusic,
        //   ),
        // ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 столбца
          childAspectRatio: 0.9, // Аспект соотношения для карточек
          crossAxisSpacing: 10, // Расстояние по горизонтали
          mainAxisSpacing: 40, // Расстояние по вертикали
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCategoryTap(categories[index]['title']),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(categories[index]['image'], fit: BoxFit.cover),
                  Text(categories[index]['title']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}