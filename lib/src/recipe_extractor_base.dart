import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_extractor/scarpers.dart';
import 'package:recipe_extractor/src/models/recipe_data.dart';
import 'package:html/parser.dart';

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

  for (var scarper in scarpers) {
    if (scarper.host == domain) {
      scarper.pageDocument = document;
      return RecipeData(
          name: scarper.recipeName(),
          ingredients: scarper.ingredients(),
          instructions: scarper.instructions());
    }
  }

  return RecipeData();
  // print(domain);
}
