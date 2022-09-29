import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/PART-2/home_screen.dart';

import 'PART-7/provider/theme_changer_provider.dart';
import 'PART-7/screens/dark_theme_screen.dart';

void main() {
  runApp(const MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

/*
part 5
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountExample(),
      ),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => CountProvider()),
        // ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        // ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        // ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
        //ChangeNotifierProvider(create: (_) =>  AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangerProvider =
              Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChangerProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(color: Colors.teal),
              brightness: Brightness.dark,
              iconTheme: const IconThemeData(color: Colors.red),
            ),
            home: const DarkThemeScreen(),
          );
        },
      ),
    );
  }
}
