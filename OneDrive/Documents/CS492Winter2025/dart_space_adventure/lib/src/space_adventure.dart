import 'dart:io';
import 'planetary_system.dart';

import 'package:dart_space_adventure/dart_space_adventure.dart';

class SpaceAdventure {
PlanetarySystem? planetarySystem;

SpaceAdventure({this.planetarySystem});

void start(){
  printGreeting();
  printIntroduction(responseToPrompt("What is your name?"));
  print('Let\'s go on an adventure\n');
  travel(
    promptForRandomOrSpecificDestination(
      'Shall I randomly choose a planet for you to visit? (Y or N)'
    )
    );   
}

void printGreeting() {
  print (
        
        'Welcome to the ${planetarySystem?.name ?? "Unknown"} System!\n'
        'There are 8 planets to explore.\n'
        );
}

void printIntroduction(String? name){
  print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
}

void travelToRandomPlanet(){
    print("placeholder");

}

void travelTo(String? planetName){
print(
    'Traveling to $planetName...'
    'Arrived at $planetName. A very cold planet, furthest form the sun.'
  );

}

void travel(bool randomDestination){
if (randomDestination){
  travelToRandomPlanet();
}
else{
  travelTo((responseToPrompt('Name the planet you would like to visit.')));
}

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

String? responseToPrompt(String prompt){
  
  print(prompt);
  return stdin.readLineSync();


}

}