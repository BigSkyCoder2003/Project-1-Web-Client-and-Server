import 'dart:io';
import 'dart:math';
import 'planet.dart';
class PlanetarySystem {
  final String name;
  final List<Planet> planets;

  PlanetarySystem({this.name = "Unnamed System", this.planets = const[]});
  final Random _random = Random();

int get numberOfPlanets => planets.length;
bool get hasPlanets => planets.isNotEmpty;

Planet randomPlanet() {
  if (!hasPlanets) return Planet.nullPlanet();
  return planets[_random.nextInt(planets.length)];
}

Planet planetWithName(String name){
return planets.firstWhere( (planet) => planet.name == name, orElse: () => Planet.nullPlanet());
}

factory PlanetarySystem.fromJson(Map<String, dynamic> json) {
  var planetList = json['planets'] as List;
  List<Planet> planetsObjects = planetList.map((planetJson) => Planet.fromJson(planetJson)).toList();
  return PlanetarySystem(
    name: json['name'],
    planets: planetsObjects,
  );

}
}

