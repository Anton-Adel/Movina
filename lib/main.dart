import 'package:flutter/material.dart';
import 'package:movina/core/Services/ServicesLocator.dart';
import 'package:movina/moves/domain/entity/movie.dart';
import 'package:movina/moves/presentation/Screens/Movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),

      home: const MainMoviesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

