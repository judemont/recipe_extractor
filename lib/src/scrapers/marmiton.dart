import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Marmiton implements Scarper {
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
    List<Node> ingredientsElList =
        document!.getElementsByClassName("card-ingredient-title");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients
          .add(ingredientEl.text!.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".recipe-step-list__container p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }

  @override
  String get host => "www.marmiton.org";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }
}
