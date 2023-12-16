import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../my_home_page/my_home_page.dart';
import '../menu_page/menu_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Определение ширины экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = screenWidth * 0.04; // 20% от ширины экрана

    return Scaffold(
      appBar: AppBar(
        title: Text('Play Cart for Adam'),
        backgroundColor: Color.fromARGB(0, 72, 158, 224), // Цвет фона AppBar
        leading: Padding(
          padding: EdgeInsets.only(left: sidePadding),
          child: IconButton(
            icon: Icon(Icons.settings), // Иконка шестеренки для меню
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage(title: 'Play Card')),
              );
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: sidePadding),
            child: IconButton(
              icon: Icon(Icons.volume_up), // Иконка громкости
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Регулировка громкости'),
                      content: Slider(
                        value: 0.5, // Значение по умолчанию для ползунка
                        min: 0.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          // Обновите значение громкости
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Закрыть диалоговое окно
                          },
                        ),
                      ],
                    );
                  },
                );
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
              'assets/png/main.png', // Путь к вашему фоновому изображению
              fit: BoxFit.cover,
            ),
          ),
          // Оверлей и кнопки
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Card Game',
                  style: TextStyle(
                    fontSize: 48, // Размер текста
                    color: Colors.white, // Цвет текста
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 550), // Отступ между элементами
                AnimatedButton(
                  onPress: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Play Card')),
                );
                    // Вставьте здесь действие для кнопки 'Играть'
                  },
                  text: 'Играть',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle: TextStyle(fontSize: 22, color: const Color.fromARGB(255, 120, 51, 51), fontWeight: FontWeight.bold),
                  backgroundColor: Colors.green,
                  borderColor: Colors.white,
                  borderRadius: 50,
                  borderWidth: 2,
                ),
                SizedBox(height: 50), // Отступ под кнопкой 'Играть'
                // Добавьте здесь другие кнопки или виджеты, если необходимо
              ],
            ),
          ),
        ],
      ),
    );
  }
}