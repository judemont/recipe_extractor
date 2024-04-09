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

Retrieve recipe information from the url of a cooking website.

## Getting started
[https://pub.dev/packages/recipe_extractor/install](https://pub.dev/packages/recipe_extractor/install)
## Usage
If an element cannot be extracted, its value will be `null`
RecipeData :
| Item        | Type              | Value Description                                                 |
|-------------|-------------------|-------------------------------------------------------------------|
| name        | String?           | Recipe name                                                       |
| image       | String?           | Presentation image link                                           |
| servings    | String?           | Number of servings (Example: For 3 people, For 10 muffins etc...) |
| ingredients | List < String > ? | Ingredient list                                                   |
| instuctions | List < String > ? | List of preparation instructions                                  |

```dart
const String recipeUrl = "https://www.allrecipes.com/recipe/218792/ggs-chocolate-sheet-cake";

RecipeData recipeData = await extractRecipe(recipeUrl);

print(recipeData.name);
print(recipeData.image);
print(recipeData.servings);
print(recipeData.ingredients?.join("\n"));
print(recipeData.instructions?.join("\n"));
```




## Additional information
| Supported recipe sites : |
|--------------------------|
| marmiton.org             |
| allrecipes.com           |
| swissmilk.ch             |
| bbcgoodfood.com          |
| simplyrecipes.com        |

More coming soon...
