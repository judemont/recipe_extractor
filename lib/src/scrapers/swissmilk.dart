import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Swissmilk implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    List<Node> titlesList =
        document!.getElementsByClassName("DetailPageHeader--title");
    if (titlesList.isNotEmpty) {
      return titlesList[0].text;
    }
    return null;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.getElementsByClassName("Ingredient");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.getElementsByClassName("PreparationList--step");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "www.swissmilk.ch";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    Element? container = document!.getElementById("IngredientsCalculatorText");
    if (container == null) {
      return null;
    } else {
      return container.text;
    }
  }
}
