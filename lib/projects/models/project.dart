import 'package:flutter/material.dart';

class Project {
  const Project({
    @required this.id,
    @required this.name,
    @required this.tags,
    @required this.tools,
    @required this.descriptionShort,
    @required this.description,
  });
  final String id;
  final String name;
  final List<String> tools;
  final List<String> tags;
  final String descriptionShort;
  final String description;
}