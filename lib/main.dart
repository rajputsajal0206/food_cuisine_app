import 'package:flutter/material.dart';
import 'package:food_cuisine_app/ui/categories.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const FoodCuisineApp());
}

class FoodCuisineApp extends StatelessWidget {
  const FoodCuisineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}


