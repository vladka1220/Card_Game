import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.play_circle_fill),
            title: const Text('Начать игру'),
            onTap: () {
              // Добавьте действие для начала игры
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Настройки'),
            onTap: () {
              // Добавьте действие для перехода к настройкам
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('О приложении'),
            onTap: () {
              // Добавьте действие для показа информации о приложении
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Выход'),
            onTap: () {
              // Добавьте действие для выхода из приложения/аккаунта
            },
          ),
        ],
      ),
    );
  }
}
