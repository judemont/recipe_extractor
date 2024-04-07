import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_extractor/src/models/recipe_data.dart';
import 'package:html/parser.dart';
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
    default:
      return RecipeData();
  }
}

// void main() {
//   extractRecipe(
//           "https://www.jdm.org/recettes/recette_cookies-maison_86989.aspx")
//       .then((value) {
//     print(value.toMap());
//   });
// }
