import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_extractor/src/models/recipe_data.dart';
import 'package:html/parser.dart';
import 'package:recipe_extractor/src/scrapers/allrecipes.dart';
import 'package:recipe_extractor/src/scrapers/marmiton.dart';

Future<RecipeData> extractRecipe(String address) async {
  Uri? url = Uri.tryParse(address);
  if (url == null) {
    throw Exception("Invalid recipe URL");
  }
  String domain = url.host;
  http.Response response;
  try {
    response = await http.Client().get(url);
  } catch (e) {
    throw Exception("Failed to access recipe site");
  }

  Document document = parse(response.body);

  // print(domain);

  switch (domain) {
    case "www.marmiton.org":
      return RecipeData(
          name: await Marmiton.recipeName(document),
          ingredients: await Marmiton.ingredients(document),
          instructions: await Marmiton.instructions(document));
    case "www.allrecipes.com":
      return RecipeData(
          name: await Allrecipes.recipeName(document),
          ingredients: await Allrecipes.ingredients(document),
          instructions: await Allrecipes.instructions(document));
    default:
      return RecipeData();
  }
}

void main() {
  extractRecipe(
          "https://www.allrecipes.com/recipe/218792/ggs-chocolate-sheet-cake/")
      .then((value) {
    print(value.toMap());
  });
}
