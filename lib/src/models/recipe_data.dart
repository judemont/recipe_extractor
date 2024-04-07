class RecipeData {
  String? name;
  List<String>? ingredients;
  List<String>? instructions;

  RecipeData({this.name, this.ingredients, this.instructions});

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
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
