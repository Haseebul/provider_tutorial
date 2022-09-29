import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text("light"),
                value: ThemeMode.light,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text("dark"),
                value: ThemeMode.dark,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          Consumer<ThemeChangerProvider>(
            builder: (context, value, child) {
              return RadioListTile<ThemeMode>(
                title: const Text("system"),
                value: ThemeMode.system,
                groupValue: value.themeMode,
                onChanged: value.setTheme,
              );
            },
          ),
          // RadioListTile<ThemeMode>(
          //   title: const Text("light"),
          //   value: ThemeMode.light,
          //   groupValue: themeChangerProvider.themeMode,
          //   onChanged: themeChangerProvider.setTheme,
          // ),
          // RadioListTile<ThemeMode>(
          //   title: const Text("dark"),
          //   value: ThemeMode.dark,
          //   groupValue: themeChangerProvider.themeMode,
          //   onChanged: themeChangerProvider.setTheme,
          // ),
          // RadioListTile<ThemeMode>(
          //   title: const Text("system"),
          //   value: ThemeMode.system,
          //   groupValue: themeChangerProvider.themeMode,
          //   onChanged: themeChangerProvider.setTheme,
          // ),
           const Icon(Icons.favorite),
        ],
      ),
    );
  }
}
