import 'package:recipe_extractor/src/models/scarper.dart';
import 'package:recipe_extractor/src/scrapers/allrecipes.dart';
import 'package:recipe_extractor/src/scrapers/bbcgoodfood.dart';
import 'package:recipe_extractor/src/scrapers/giallozafferano.dart';
import 'package:recipe_extractor/src/scrapers/marmiton.dart';
import 'package:recipe_extractor/src/scrapers/recipetineats.dart';
import 'package:recipe_extractor/src/scrapers/simplyrecipes.dart';
import 'package:recipe_extractor/src/scrapers/swissmilk.dart';
import 'package:recipe_extractor/src/scrapers/topsecretrecipes.dart';

List<Scarper> scarpers = [
  Allrecipes(),
  Bbcgoodfood(),
  Marmiton(),
  Simplyrecipes(),
  Swissmilk(),
  Recipetineats(),
  Topsecretrecipes(),
  Giallozafferano()
];
