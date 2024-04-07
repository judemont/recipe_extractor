import 'package:html/dom.dart';

abstract class Scarper {
  String? recipeName();
  List<String>? ingredients();
  List<String>? instructions();
  String get host;
  set pageDocument(Document document);
}
