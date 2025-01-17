import 'package:test/test.dart';
import 'package:recipe_extractor/recipe_extractor.dart';

void main() {
  extractRecipe(
          "https://www.swissmilk.ch/de/rezepte-kochideen/rezepte/SM2023_DIVE_114/linsen-dal/?collection=120104&index=0")
      .then(
    (recipeData) {
      print(recipeData.name);
      print(recipeData.image);
      print(recipeData.servings);
      print(recipeData.ingredients?.join("\n"));
      print(recipeData.instructions?.join("\n\n"));
      print(recipeData.source);
    },
  );
  group('A group of tests', () {
    // final awesome = Awesome();

    // setUp(() {
    //   // Additional setup goes here.
    // });

    // test('First Test', () {
    //   expect(awesome.isAwesome, isTrue);
    // });
  });
}
