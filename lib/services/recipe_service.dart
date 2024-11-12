import '../models/recipe.dart';

class RecipeService{
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe){
    _recipes.add(recipe);
  }
  void editRecipe(String id, Recipe updatedRecipe){
    final index = _recipes.indexWhere((recipe) => recipe.id == id);
    if(index != -1){
      _recipes[index] = updatedRecipe;
    }
  }
  void deleteRecipe(String id){
    _recipes.removeWhere((recipe) => recipe.id == id);
  }
}