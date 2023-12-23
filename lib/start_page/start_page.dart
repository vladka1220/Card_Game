import 'package:card_game_adam/Customs/audioplayers.dart';
import 'package:flutter/material.dart';

import '../Customs/PulsatingVolumeIcon.dart';
import '../Customs/RotatingGearIcon.dart';
import '../menu_page/menu_page.dart';
import '../my_home_page/my_home_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Получение ширины экрана для динамического отображения элементов
    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = screenWidth * 0.045; // 20% от ширины экрана

    return Scaffold(
      extendBodyBehindAppBar: true, // Расширяем тело за AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный фон AppBar
        leading: Padding(
          padding: EdgeInsets.only(left: sidePadding),
          child: IconButton(
            icon: const RotatingGearIcon(), // Иконка шестеренки для меню
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MenuPage(title: 'Play Card')),
              );
            },
          ),
        ),

        actions: <Widget>[
          // Большая иконка громкости черного цвета
          Padding(
            padding: EdgeInsets.only(right: sidePadding),
            child: IconButton(
              icon: const PulsatingVolumeIcon(),
              onPressed: () {
                if (AudioManager.isPlaying) {
                  AudioManager.pauseBackgroundMusic();
                }
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          // Фоновое изображение
          Positioned.fill(
            child: Image.asset(
              'assets/png/main.png',
              fit: BoxFit.cover,
            ),
          ),

          Align(
            // Размещение кнопки в нижней части экрана
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.09),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: 'Play Card')),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.5, // ширина - 15% от ширины экрана
                  height: MediaQuery.of(context).size.width *
                      0.20, // высота - 15% от ширины экрана
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/play.png'),
                      fit: BoxFit
                          .contain, // Изображение сохраняет свои пропорции
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
