import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Cucchiaio implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    List<Node> titlesList = document!.getElementsByTagName("h1");
    if (titlesList.isNotEmpty) {
      return titlesList[0].text?.trim();
    }
    return null;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.querySelectorAll(".col-md-8 .col-md-6 li");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".recipe_procedures");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!
          .replaceAll(RegExp(r"\s+"), " ")
          .trim()
          .substring(2));
    }

    return instructions;
  }

  @override
  String get host => "cucchiaio.it";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    List<Element> containers =
        document!.querySelectorAll(".w-40 w-md-auto, .text-md-right");
    return containers.lastOrNull?.text.trim();
  }

  @override
  String? image() {
    return "https://www.cucchiaio.it${document!.querySelector(".cq-dd-image")?.attributes["src"]}";
  }
}
