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
  String domain = url.host.replaceFirst(RegExp(r'^[^.]*\.(?=\w+\.\w+$)'), "");
  http.Response response;
  try {
    response = await http.Client().get(url, headers: {
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36"
    });
  } catch (e) {
    throw Exception("Failed to access recipe site");
  }

  Document document = parse(response.body);

  for (var scarper in scarpers) {
    if (scarper.host == domain) {
      scarper.pageDocument = document;

      return RecipeData(
          name: scarper.recipeName(),
          image: scarper.image(),
          servings: scarper.servings(),
          ingredients: scarper.ingredients(),
          instructions: scarper.instructions(),
          source: address);
    }
  }

  return RecipeData();
  // print(domain);
}
