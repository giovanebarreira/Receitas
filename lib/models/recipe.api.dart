import 'dart:convert';
import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/list', {
      'limit': '50',
      'start': '0',
      'tag': 'list.recipe.popular'
    });

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'ad628aa229msh94fac182f06e059p13aa9ejsnc87246afd6eb',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(response.body);
    List results = [];

    for (var i in data['feed']) {
      results.add(i['content']);
    }

    return Recipe.recipesFromSnapshot(results);
  }
}
