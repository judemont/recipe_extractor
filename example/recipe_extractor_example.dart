import 'package:recipe_extractor/recipe_extractor.dart';

void main() async {
  const String recipeUrl =
      "https://www.allrecipes.com/recipe/218792/ggs-chocolate-sheet-cake";

  RecipeData recipeData = await extractRecipe(recipeUrl);

  print(recipeData.name);
  print(recipeData.ingredients);
  print(recipeData.instructions);
}
