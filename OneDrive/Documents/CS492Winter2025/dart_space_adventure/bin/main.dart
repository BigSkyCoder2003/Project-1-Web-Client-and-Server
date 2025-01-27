import 'dart:io';
import 'dart:convert';
import 'package:dart_space_adventure/dart_space_adventure.dart';

const systemName = 'Solar System';
void main(List<String> arguments) async {
  List<Planet> planetsList = [];
  final file = File('planetarySystem.json');
  String jsonString = await file.readAsString();

  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  var planets = jsonMap['planets'] as List;
  print(planets);
  for (var planetJson in planets){
    Planet planet = Planet.fromJson(planetJson);
    planetsList.add(planet);
  }

  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: jsonMap['name'], 
      planets: planetsList
        
    )
  ).start();
}
       