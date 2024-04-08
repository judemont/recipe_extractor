import 'package:recipe_extractor/recipe_extractor.dart';
import 'package:test/test.dart';

void main() {
  extractRecipe(
          "https://www.swissmilk.ch/de/rezepte-kochideen/rezepte/LM200910_59/tomatenrisotto/?collection=97335&index=0")
      .then((value) {
    print(value.toMap());
  });
  group('A group of tests', () {
    // final awesome = Awesome();

    // setUp(() {
    //   // Additional setup goes here.
    // });

    // test('First Test', () {
    //   expect(awesome.isAwesome, isTrue);
    // });
  });
}
