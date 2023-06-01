class Recipe {
  String? name;
  String? imageUrl;
  double? rating;
  String? totalTime;
  List<IngredientLines>? ingredients;

  Recipe({
    this.name,
    this.imageUrl,
    this.rating,
    this.totalTime,
    this.ingredients,
  });

  Recipe.fromJson(Map<dynamic, dynamic> json) {
    name = json['details']['name'];
    rating = json['details']['rating'];
    totalTime = json['details']['totalTime'];

    // Nested list access
    if (json['ingredientLines'] != null) {
      ingredients = <IngredientLines>[];

      (json['ingredientLines'] as List).forEach((element) {
        ingredients?.add(IngredientLines.fromJson(element));
      });
    }

    // Nested list access
    if (json['details']['images'] != null) {
      var imagesList = <ImageUrl>[];

      (json['details']['images'] as List).forEach((element) {
        imagesList.add(ImageUrl.fromJson(element));
      });

      imageUrl = imagesList[0].hostedLargeUrl;
    }
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}

class IngredientLines {
  String? wholeLine;

  IngredientLines({this.wholeLine});

  IngredientLines.fromJson(Map<dynamic, dynamic> json) {
    wholeLine = json['wholeLine'];
  }
}

class ImageUrl {
  String? hostedLargeUrl;

  ImageUrl({this.hostedLargeUrl});

  ImageUrl.fromJson(Map<dynamic, dynamic> json) {
    hostedLargeUrl = json['hostedLargeUrl'];
  }
}
