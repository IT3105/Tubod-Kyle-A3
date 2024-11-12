import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';

class RecipeAddScreen extends StatefulWidget{
  final RecipeService recipeService;
  const RecipeAddScreen({super.key, required this.recipeService});
  @override
  State<RecipeAddScreen> createState() => _RecipeAddScreenState();
}
class _RecipeAddScreenState extends State<RecipeAddScreen>{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();

  void _addRecipe(){
    final title = _titleController.text;
    final description = _descriptionController.text;
    final ingredients = _ingredientsController.text;

    if(title.isNotEmpty && description.isNotEmpty && ingredients.isNotEmpty){
      final newRecipe = Recipe(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        ingredients: ingredients,
      );
      widget.recipeService.addRecipe(newRecipe);
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Recipe Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Recipe Description'),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: const InputDecoration(labelText: 'Ingredients'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addRecipe,
              child: const Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
