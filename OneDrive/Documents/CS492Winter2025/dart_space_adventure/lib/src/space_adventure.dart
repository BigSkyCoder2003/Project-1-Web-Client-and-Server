import 'dart:io';
import 'dart:math';
import "planet.dart";
import 'planetary_system.dart';
import 'package:dart_space_adventure/dart_space_adventure.dart';

class SpaceAdventure {
final PlanetarySystem planetarySystem;

SpaceAdventure({required this.planetarySystem});

void start(){
  printGreeting();
  printIntroduction(responseToPrompt("What is your name?"));
  print('Let\'s go on an adventure!\n');
  if (planetarySystem.hasPlanets) {


  travel(
    promptForRandomOrSpecificDestination(
      'Shall I randomly choose a planet for you to visit? (Y or N)'
    )
    );
  }
  else {
    print("There are no planets to explore.");
  }   
}

void printGreeting() {
  print ('Welcome to the ${planetarySystem.name}!');
  print('There are ${planetarySystem.numberOfPlanets} planets in the system');
}

void printIntroduction(String name){
  print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
}

void travelTo(Planet planet){
  print('Traveling to ${planet.name}');
  print('Arrived at ${planet.name}. ${planet.description}');

}


void travel(bool randomDestination){
  Planet planet;
if (randomDestination){
  planet = planetarySystem.randomPlanet();
}
else{
  planet = planetarySystem.planetWithName(responseToPrompt('Name the planet you would like to visit.'));
}
travelTo(planet);

}

bool promptForRandomOrSpecificDestination(String prompt){
  String? answer;
  while (answer != 'Y' && answer != 'N'){
   answer = responseToPrompt(prompt);
if (answer == 'Y'){
  return true;
} else if(answer == "N"){
  return false;
}else{
  print("Sorry. I didn't get that.\n");
} 
}
return false;
}

String responseToPrompt(String prompt){
  
  print(prompt);
  return stdin.readLineSync()!;


}

}