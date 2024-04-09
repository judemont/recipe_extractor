import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Simplyrecipes implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    Element? titleEl = document!.getElementById("recipe-block__header_1-0");
    if (titleEl != null) {
      return titleEl.text;
    }
    return null;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.querySelectorAll(".structured-ingredients__list-item");

    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll("#structured-project__steps_1-0 p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "www.simplyrecipes.com";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    Element? container =
        document!.querySelector(".project-meta__recipe-serving");
    return container?.children.lastOrNull?.text;
  }

  @override
  String? image() {
    return document!.querySelector(".primary-image__image")?.attributes["src"];
  }
}
