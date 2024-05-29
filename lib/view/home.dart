import 'package:flutter/material.dart';
import 'package:mode/provider/provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Consumer<UiProvider>(
        builder: (context, uiProvider, _) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark Mode"),
                trailing: Switch(
                  value: uiProvider.isDark,
                  onChanged: (value) => uiProvider.changeTheme(value),
                  activeTrackColor: uiProvider.isDark ? Colors.purple : Colors.grey,
                  activeColor: uiProvider.isDark ? Colors.purpleAccent : Colors.grey,
                  inactiveTrackColor: uiProvider.isDark ? Colors.purple : Colors.grey,
                  inactiveThumbColor: uiProvider.isDark ? Colors.yellow : Colors.white,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
