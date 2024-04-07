import 'package:html/dom.dart';

class Swissmilk {
  static Future<String?> recipeName(Document document) async {
    List<Node> titlesList =
        document.getElementsByClassName("DetailPageHeader--title");
    if (titlesList.isNotEmpty) {
      return titlesList[0].text;
    }
    return null;
  }

  static Future<List<String>?> ingredients(Document document) async {
    List<Element> ingredientsElList =
        document.getElementsByClassName("Ingredient");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  static Future<List<String>?> instructions(Document document) async {
    List<Node> instructionsElList =
        document.getElementsByClassName("PreparationList--step");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }
}
