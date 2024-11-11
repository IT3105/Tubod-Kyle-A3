import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';
import '../widgets/recipe_card.dart';
import '/screens/recipe_add_screen.dart'; // Ensure the correct path

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final RecipeService _recipeService = RecipeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Collection'),
      ),
      body: ListView.builder(
        itemCount: _recipeService.recipes.length,
        itemBuilder: (context, index) {
          final recipe = _recipeService.recipes[index];
          return RecipeCard(recipe: recipe);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Recipe Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecipeAddScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
