import 'package:darkmode/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:darkmode/theme/theme_manager.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        actions: [
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              themeManager.toggleTheme(newValue);
            },
          ),
        ],
      ),
      body: ElevatedButton(
        onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
        },
        child: const Text("hello"),
      ),
    );
  }
}
