import 'package:flutter/material.dart';
import 'package:github_plus_plus/view/welcome/welcome_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // todo: auth token: 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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: WelcomeView(),
    );
  }
}
