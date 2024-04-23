import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Recipetineats implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    List<Node> titlesList = document!.getElementsByTagName("h1");
    return titlesList.isNotEmpty ? titlesList.first.text : null;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.querySelectorAll(".wprm-recipe-ingredient");

    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceFirst("▢", "").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".wprm-recipe-instruction-text");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "recipetineats.com";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    List<Element> servings =
        document!.getElementsByClassName("wprm-recipe-servings");

    return servings.isNotEmpty ? servings[0].text : null;
  }

  @override
  String? image() {
    List<Element> figure =
        document!.getElementsByClassName("wprm-recipe-image");

    return figure.isNotEmpty
        ? figure[0].children.firstOrNull?.attributes["src"]
        : null;
  }
}
