import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
