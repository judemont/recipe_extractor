import 'package:html/dom.dart';
import 'package:recipe_extractor/src/models/scarper.dart';

class Bbcgoodfood implements Scarper {
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
        document!.querySelectorAll(".ingredients-list__item");

    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  @override
  List<String>? instructions() {
    List<Node> instructionsElList =
        document!.querySelectorAll(".method-steps__list-item");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      var instructionContent = instructionEl.children[1];
      instructions.add(instructionContent.text.trim());
    }

    return instructions;
  }

  @override
  String get host => "bbcgoodfood.com";

  @override
  set pageDocument(Document document) {
    this.document = document;
  }

  @override
  String? servings() {
    List<Element> container =
        document!.getElementsByClassName("icon-with-text__children");

    if (container.length >= 3) {
      return container[2].text;
    }
    return null;
  }

  @override
  String? image() {
    return document!
        .querySelector(".post-header__image-container .image__img")
        ?.attributes["src"];
  }
}
