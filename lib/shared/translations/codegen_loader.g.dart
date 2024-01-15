// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "woman": "بنت",
  "man": "ولد",
  "height": "طولك",
  "age": "عمرك",
  "weight": "وزنك",
  "calculate": "أحسب",
  "yourGender": "جنسك",
  "yourHeight": "طولك",
  "yourWeight": "وزنك",
  "yourAge": "عمرك",
  "whatIsYourGender": "اختر جنسك",
  "msgToUser": "انا مش عارف؟ اختر جنسك من اي زرار تحت",
  "bmiResult": "(BMI) نتيجتك"
};
static const Map<String,dynamic> en = {
  "woman": "Woman",
  "man": "Man",
  "height": "Height",
  "age": "Age",
  "weight": "weight",
  "calculate": "Calculate",
  "yourGender": "Gender",
  "yourHeight": "Height",
  "yourWeight": "Weight",
  "yourAge": "Age",
  "whatIsYourGender": "What is your gender",
  "msgToUser": "I don't know? Please click to selcted your gender",
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
  "whatIsYourGender": "Cuál es tu género",
  "msgToUser": "¿No lo sé? Elige tu género desde cualquier botón bajo",
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
  "whatIsYourGender": "Quel est votre genre",
  "msgToUser": "Je ne sais pas? Choisissez votre sexe à partir de n’importe quel bouton sous",
  "bmiResult": "(BMI) ton score"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "es": es, "fr": fr};
}
