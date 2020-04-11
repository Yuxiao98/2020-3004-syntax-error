import 'package:sports_fields_rental/FieldType.dart';
import 'package:sports_fields_rental/FieldInformation.dart';
class Field{
  FieldType type;
  String imageUrl;
  String name;
  String description;
  FieldInformation information;
  Field(FieldType type, String imageUrl, String name, String description, FieldInformation information) {
    this.type = type;
    this.imageUrl = imageUrl;
    this.name = name;
    this.description = description;
    this.information = information;
  }
}