import 'dart:io';
import 'package:args/args.dart' show ArgParser, ArgResults;
import 'dart:math' show Random;

void main(List<String> arguments) {
  // if no arguments provided then exit
  if (arguments.isEmpty) {
    print('No arguments provided.');
    exitCode = 0;
    return;
  }
  // so we have arguments, lets work with them
  final parser = ArgParser()
                    ..addFlag("help", negatable: false, abbr: 'h', help: 'Show this help message')
                    ..addFlag("version", negatable: false, abbr: 'v', help: 'Show version information');
  final ArgResults arg = parser.parse(arguments);
  if (arg.arguments.contains("-h")
      || arg.arguments.contains("--help")) {
    print('Usage:\ndice_thrower dice/s\ndice_thrower [options]\n');
    print("Dice/s are numbers that represent the number of faces on the die. If you want more dice, separate each die with a space.\n");
    print('Options:');
    print('  -h, --help     Show this help message');
    print('  -v, --version  Show version information');
    print("\n");
  }
  
  if (arg.arguments.contains("-v")
             || arg.arguments.contains("--version")) {
    print('dice_thrower version 0.0.1');
    print("\n");
  }

  final argumentsList = arg.rest;
  diceThrower(argumentsList);
  exitCode = 0;
  return;
}

List<int> inputChecker(List<String> arguments) {
  // check if arguments are integers
  for (var dice in arguments) {
    // check if dice is a number
    if (int.tryParse(dice) == null) {
      print('Invalid argument: $dice');
      print('Please provide a list of integers.');
      exitCode = 1;
      return [];
    }
  }
  // we have checked that all arguments are not null
  // now we can safely check, if all arguments are greater than 1
  final List<int> diceList = arguments.map((dice) => int.parse(dice)).toList();
  for (int dice in diceList) {
    // check if dice is greater than 1
    if (dice <= 1) {
      print('Invalid argument: $dice');
      print('Please provide a list of integers greater than 1.');
      exitCode = 1;
      return [];
    }
  }
  return diceList;
}

void randomizer(List<int> diceList) {
  // if we reach here, then we have valid arguments
  Random random = Random();
  for (int dice in diceList) {
    int randomNumber = random.nextInt(dice) + 1;
    print('Rolling a $dice sided die: $randomNumber');
  }
}

void diceThrower(List<String> arguments) {
  // check if arguments are integers
  final List<int> diceList = inputChecker(arguments);
  if (diceList.isEmpty) {
    return;
  }
  // if we reach here, then we have valid arguments
  randomizer(diceList);
}
