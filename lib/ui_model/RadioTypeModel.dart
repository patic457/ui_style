import 'dart:ffi';

// Radio button with Title + Subtitle + Prefix
class RadioType1Model {
  String title;
  String subtitle;
  String amount;
  String value;
  bool isDisable;

  RadioType1Model(
      {required this.title,
      required this.subtitle,
      required this.amount,
      required this.value,
      required this.isDisable});
}

// Radio button with Icon + Title
class RadioType2Model {
  String title;
  String image;
  String value;
  bool isDisable;

  RadioType2Model(
      {required this.title,
      required this.image,
      required this.value,
      required this.isDisable});
}

// Radio button with Selection Frame 1 line
class RadioType3Model {
  String title;
  bool isDisable;
  String value;

  RadioType3Model(
      {required this.title, required this.isDisable, required this.value});
}

// Radio button with Selection Frame full info
class RadioType4Model {
  String title;
  String subtitle;
  String desc;
  bool isDisable;
  String value;

  RadioType4Model(
      {required this.title,
      required this.subtitle,
      required this.desc,
      required this.isDisable,
      required this.value});
}
