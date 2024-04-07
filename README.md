<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Retrieve recipe name, ingredients and instructions from a recipe URL.


## Getting started
With dart : 
```bash
dart pub get recipe_extractor
```
With Flutter : 
```bash
flutter pub get recipe_extractor
```
Import package :
```dart
import package:recipe_extractor/recipe_extractor.dart
```
## Usage

```dart
const String recipeUrl = "https://www.allrecipes.com/recipe/218792/ggs-chocolate-sheet-cake";

RecipeData recipeData = await extractRecipe(recipeUrl);

print(recipeData.name);
print(recipeData.ingredients);
print(recipeData.instructions);
```

## Additional information
Supported recipe sites :
- marmiton.org
- allrecipes.com

More coming soon...
