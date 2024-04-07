import 'package:recipe_extractor/src/models/scarper.dart';
import 'package:recipe_extractor/src/scrapers/allrecipes.dart';
import 'package:recipe_extractor/src/scrapers/bbcgoodfood.dart';
import 'package:recipe_extractor/src/scrapers/marmiton.dart';
import 'package:recipe_extractor/src/scrapers/simplyrecipes.dart';
import 'package:recipe_extractor/src/scrapers/swissmilk.dart';

List<Scarper> scarpers = [
  Allrecipes(),
  Bbcgoodfood(),
  Marmiton(),
  Simplyrecipes(),
  Swissmilk()
];
