import 'package:flutter/material.dart';
import '../services/recipe_service.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_add_screen.dart';
import 'recipe_edit_screen.dart';

class RecipeListScreen extends StatefulWidget{
  const RecipeListScreen({super.key});
  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}
class _RecipeListScreenState extends State<RecipeListScreen>{
  final RecipeService _recipeService = RecipeService();
  void _navigateToAddRecipe() async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeAddScreen(recipeService: _recipeService),
      ),
    );
    setState(() {});
  }
  void _navigateToEditRecipe(Recipe recipe) async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeEditScreen(
          recipeService: _recipeService,
          recipe: recipe,
        ),
      ),
    );
    setState(() {});
  }
  void _deleteRecipe(String id){
    _recipeService.deleteRecipe(id);
    setState(() {});
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Collection'),
      ),
      body: ListView.builder(
        itemCount: _recipeService.recipes.length,
        itemBuilder:(context, index){
          final recipe = _recipeService.recipes[index];
          return RecipeCard(
            recipe: recipe,
            onEdit: () => _navigateToEditRecipe(recipe),
            onDelete: () => _deleteRecipe(recipe.id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddRecipe,
        child: const Icon(Icons.add),
      ),
    );
  }
}
