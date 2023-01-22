import 'dart:ui';
import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "woman": "امرأة",
  "man": "رجل",
  "height": "طول",
  "age": "عمر",
  "weight": "وزن",
  "calculate": "أحسب",
  "yourGender": "جنسك",
  "yourHeight": "طولك",
  "yourWeight": "وزنك",
  "yourAge": "عمرك",
  "bmiResult": "(BMI) نتيجتك"
};
static const Map<String,dynamic> en = {
  "woman": "woman",
  "man": "man",
  "height": "height",
  "age": "age",
  "weight": "weight",
  "calculate": "Calculate",
  "yourGender": "gender",
  "yourHeight": "height",
  "yourWeight": "weight",
  "yourAge": "age",
  "bmiResult": "(BMI) your result"
};
static const Map<String,dynamic> es = {
  "woman": "mujer",
  "man": "hombre",
  "height": "altura ",
  "age": "edad ",
  "weight": "peso ",
  "calculate": "calcular",
  "yourGender": "tu género",
  "yourHeight": "tu altura",
  "yourWeight": "tu peso",
  "yourAge": "tu edad",
  "bmiResult": "(BMI) tu resultado"
};
static const Map<String,dynamic> fr = {
  "woman": "femme",
  "man": "homme ",
  "height": "long ",
  "age": "âge",
  "weight": "poids",
  "calculate": "calculer",
  "yourGender": "votre sexe",
  "yourHeight": "votre taille",
  "yourWeight": "poids",
  "yourAge": "âge",
  "bmiResult": "(BMI) ton score"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "es": es, "fr": fr};
}
