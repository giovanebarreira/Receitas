import 'package:flutter/material.dart';
import 'package:recipe_app/views/recipe_details.dart';
import 'package:recipe_app/models/recipe.dart';

class RouterNavigation extends StatelessWidget {
  final Recipe recipe;

  const RouterNavigation({super.key, required this.recipe});

  void navigateRecipeDetails(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecipeDetails(recipe: recipe,)),
    );
  }

  @override
  Widget build(context) {
    return GestureDetector(onTap: () => navigateRecipeDetails(context));
  }
}
