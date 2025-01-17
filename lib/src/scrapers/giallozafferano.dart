import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Giallozafferano implements Scarper {
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
        document!.querySelectorAll(".gz-ingredient");

    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".gz-content-recipe-step p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "giallozafferano.it";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    List<Element> elements =
        document!.getElementsByClassName("gz-title-ingredients");

    if (elements.isNotEmpty) {
      return elements[0].text;
    }
    return null;
  }

  @override
  String? image() {
    var imageDiv = document!.querySelector(".gz-featured-image");
    return imageDiv?.children.first.attributes["src"];
  }
}
