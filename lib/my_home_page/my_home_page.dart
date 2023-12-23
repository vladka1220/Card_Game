import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

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
    {'title': 'Домашние приборы', 'image': 'assets/png/home_electronic.png'},
    {'title': 'Цвета', 'image': 'assets/png/cor.png'},
    {'title': 'Машины', 'image': 'assets/png/car0.png'},
    {'title': 'Дикие животные', 'image': 'assets/png/wild.png'},
    {'title': 'Музыкальные инструменты', 'image': 'assets/png/violin.jpg'},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Расширяем тело за AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный фон AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Возвращает пользователя на StartPage
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Фоновое изображение
          Positioned.fill(
            child: Image.asset(
              'assets/png/fone.png', // Укажите здесь путь к вашему фоновому изображению
              fit: BoxFit.cover, // Заполнение всего доступного пространства
            ),
          ),
          // Контент
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 столбца
              childAspectRatio: 0.9, // Аспект соотношения для карточек
              crossAxisSpacing: 10, // Расстояние по горизонтали
              mainAxisSpacing: 60, // Расстояние по вертикали
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onCategoryTap(categories[index]['title']),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(categories[index]['image'],
                          fit: BoxFit.cover),
                      Text(categories[index]['title']),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
