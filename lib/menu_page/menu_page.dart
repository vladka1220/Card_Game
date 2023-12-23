import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required String title});

  Future<void> _showAppInfoDialog(BuildContext context) async {
    final BuildContext dialogContext =
        context; // Сохраняем BuildContext в переменной

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    showAboutDialog(
      context: dialogContext,
      applicationIcon: const Icon(Icons.info), // Иконка приложения
      applicationName: packageInfo.appName, // Название приложения
      applicationVersion: packageInfo.version, // Версия приложения
      applicationLegalese:
          'Ваше описание или информация о приложении.', // Описание приложения
    );
  }

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
            title: const Text('Посмотреть полную версию'),
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
              // Add action to show app information
              _showAppInfoDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
