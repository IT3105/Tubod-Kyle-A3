import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/recipe_service.dart';

class RecipeEditScreen extends StatefulWidget{
  final RecipeService recipeService;
  final Recipe recipe;

  const RecipeEditScreen({
    super.key,
    required this.recipeService,
    required this.recipe,
  });
  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}
class _RecipeEditScreenState extends State<RecipeEditScreen>{
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _ingredientsController;

  @override
  void initState(){
    super.initState();
    _titleController = TextEditingController(text: widget.recipe.title);
    _descriptionController = TextEditingController(text: widget.recipe.description);
    _ingredientsController = TextEditingController(text: widget.recipe.ingredients);
  }
  void _updateRecipe(){
    final updatedRecipe = Recipe(
      id: widget.recipe.id,
      title: _titleController.text,
      description: _descriptionController.text,
      ingredients: _ingredientsController.text,
    );
    widget.recipeService.editRecipe(widget.recipe.id, updatedRecipe);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Recipe'),
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
              onPressed: _updateRecipe,
              child: const Text('Update Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
