import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:darkmode/theme/theme_constant.dart';
import 'package:darkmode/theme/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'newPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => ThemeManager(isDarkMode),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: NewPage(),
    );
  }
}
