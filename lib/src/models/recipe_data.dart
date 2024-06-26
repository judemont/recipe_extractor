class RecipeData {
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  String? servings;
  String? image;
  String? source;

  RecipeData({
    this.name,
    this.image,
    this.servings,
    this.ingredients,
    this.instructions,
    this.source,
  });

  Map<String, Object?> toMap() {
    return {
      'name': name,
      "image": image,
      'servings': servings,
      'ingredients': ingredients,
      'instructions': instructions,
      'source': source,
    };
  }

  // static Recipe fromMap(Map<String, Object?> map) {
  //   return Recipe(
  //     id: map['id'] as int,
  //     steps: map['steps'] as String,
  //     title: map['title'] as String,
  //     ingredients: map['ingredients'] as String,
  //   );
  // }
}
