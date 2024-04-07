import 'package:recipe_extractor/recipe_extractor.dart';
import 'package:test/test.dart';

void main() {
  extractRecipe("https://www.bbcgoodfood.com/recipes/easy-chocolate-cake")
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
