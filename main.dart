import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Collection',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RecipeListScreen(),
    );
  }
}
