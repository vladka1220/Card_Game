
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../my_home_page/my_home_page.dart';
import '../menu_page/menu_page.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play Cart for Adam')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Play Card')),
                );
              },
              text: 'Играть',
              // Другие параметры для стилизации кнопки
            ),
            ElevatedButton(
              onPressed: () {
                // Логика для настроек
              },
              child: const Text('Настройки'),
            ),
            AnimatedButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuPage(title: 'Play Card')),
                );
              },
              text: 'Меню',
            ),
            ElevatedButton(
            onPressed: () {
              // Add action for the "Выход" button
              Navigator.pop(context); // Close the menu
              // Add code here to exit the app, such as logging out, clearing tokens, or performing other necessary actions.
            },
            child: const Text('Выход'),
            ),
  
          ],
        ),
      ),
    );
  }
}


//Почтитать про AnimatedButtom вместо ElevatedButton