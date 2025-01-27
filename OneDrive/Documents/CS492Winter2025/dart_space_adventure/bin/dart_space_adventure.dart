import 'package:dart_space_adventure/dart_space_adventure.dart' as dart_space_adventure;
import 'dart:io';

void printGreeting() {
  print (
        'Welcome to the Solar System!\n'
        'There are 8 planets to explore.\n'
        );
}

// String? getName() {
//   print('What is your name?');
//   return stdin.readLineSync(); 
// }


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

// String? randomOrNot(){
//   return stdin.readLineSync();
// }

String? responseToPrompt(String prompt){
  
  print(prompt);
  return stdin.readLineSync();


}

void main(List<String> arguments) {
  printGreeting();
  printIntroduction(responseToPrompt("What is your name?"));
  print('Let\'s go on an adventure\n');
  travel(
    promptForRandomOrSpecificDestination(
      'Shall I randomly choose a planet for you to visit? (Y or N)'
    )
  
    );
}