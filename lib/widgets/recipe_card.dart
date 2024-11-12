import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        title: Text(recipe.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(recipe.description),
            const SizedBox(height: 8),
            Text('Ingredients: ${recipe.ingredients}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}