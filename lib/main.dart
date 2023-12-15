
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:logger/logger.dart';
final logger = Logger();


void main() {
  runApp(const PlayCard());
}

class PlayCard extends StatelessWidget {
  const PlayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Card',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 162, 164),
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade500),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Play Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  logger.d('Выбрана категория: $category'); // Используйте logger.d для отладочных сообщений
}
//

@override
void initState() {
  super.initState();
  playMusic();
  logger.i('Инициализация страницы'); // Используйте logger.i для информационных сообщений
}


  void playMusic() async {
  String audioPath = 'assets/audio/my_audio.mp3';
  int result = await audioPlayer.play(audioPath, isLocal: true);

  if (result == 1) {
    setState(() {
      isPlaying = true;
    });
  }
}

  void toggleMusic() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

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
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {},
          ),
        ],
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
                  Image.asset(categories[index]['image'], fit: BoxFit.cover), // Изображение категории
                  Text(categories[index]['title']), // Текстовое название категории
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}