import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Topsecretrecipes implements Scarper {
  Document? document;

  @override
  String? recipeName() {
    Element? titleEl = document!.querySelector("h2.title");

    return titleEl?.text;
  }

  @override
  List<String>? ingredients() {
    List<Element> ingredientsElList =
        document!.querySelectorAll(".bcse-ingredients ul li");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".tsr-recipe-instuctions p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      if (instructionEl.text!.trim().isNotEmpty) {
        instructions.add(instructionEl.text!.trim());
      }
    }

    return instructions;
  }

  @override
  String get host => "topsecretrecipes.com";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    return null;
  }

  @override
  String? image() {
    String? imageSrc =
        document!.querySelector(".product-thumbnail")?.attributes["src"];
    return imageSrc != null ? "https:$imageSrc" : null;
  }
}
