import 'dart:convert';

class Planet {
  final String name;
  final String description;


Planet({required this.name, required this.description});

factory Planet.fromJson(Map<String, dynamic> json){
  return Planet(
    name: json['name'],
    description: json['description']
  );


}

Planet.nullPlanet(): name = "Null", description ="Null";
}

