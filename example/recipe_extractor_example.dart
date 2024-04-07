import 'package:recipe_extractor/recipe_extractor.dart';

void main() async {
  const String recipeUrl =
      "https://www.marmiton.org/recettes/recette_cookies-maison_86989.aspx";

  RecipeData recipeData = await extractRecipe(recipeUrl);

  print(recipeData.name);
  print(recipeData.ingredients);
  print(recipeData.instructions);
}
