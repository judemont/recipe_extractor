import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Allrecipes implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    List<Node> titlesList = document!.getElementsByTagName("h1");
    if (titlesList.isNotEmpty) {
      return titlesList[0].text;
    }
    return null;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.querySelectorAll(".mntl-structured-ingredients__list-item p");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll("#recipe__steps-content_1-0 p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "allrecipes.com";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    List<Element> container =
        document!.getElementsByClassName("mntl-recipe-details__value");
    return container.lastOrNull?.text;
  }

  @override
  String? image() {
    return document!
        .querySelector(".universal-image__image")
        ?.attributes["data-src"];
  }
}
