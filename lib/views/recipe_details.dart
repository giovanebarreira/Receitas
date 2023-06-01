import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe? recipe;
  const RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detalhes da receita'),
            Icon(Icons.restaurant_menu_outlined),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                recipe?.imageUrl ?? '',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    for (var ingredient in recipe?.ingredients ?? [])
                      Row(
                        children: [ 
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                ingredient.wholeLine,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
