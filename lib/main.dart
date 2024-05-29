import 'package:flutter/material.dart';
import 'package:mode/provider/provider.dart';
import 'package:mode/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, uiProvider, _) {
          return MaterialApp(
            title: 'Dark light mode',
            debugShowCheckedModeBanner: false,
            themeMode: uiProvider.isDark ? ThemeMode.dark : ThemeMode.light,
            // themeMode: ThemeMode.system, // Set theme mode to system
            darkTheme: uiProvider.darkTheme,
            theme: uiProvider.lightTheme,
            home: const Settings(),
          );
        },
      ),
    );
  }
}
