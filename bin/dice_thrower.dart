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
    stdout.writeln('Usage:\ndice_thrower dice/s\ndice_thrower [options]\n');
    stdout.writeln("Dice/s are numbers that represent the number of faces on the die. If you want more dice, separate each die with a space.\n");
    stdout.writeln('Options:');
    stdout.writeln('  -h, --help     Show this help message');
    stdout.writeln('  -v, --version  Show version information');
    stdout.writeln("\n");
  }
  
  if (arg.arguments.contains("-v")
             || arg.arguments.contains("--version")) {
    stdout.writeln('dice_thrower version 0.0.1');
    stdout.writeln("\n");
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
      stdout.writeln('Invalid argument: $dice');
      stdout.writeln('Please provide a list of integers.');
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
      stdout.writeln('Invalid argument: $dice');
      stdout.writeln('Please provide a list of integers greater than 1.');
      exitCode = 1;
      return [];
    }
  }
  return diceList;
}

List<int> randomizer(List<int> diceList) {
  // if we reach here, then we have valid arguments
  Random random = Random();
  List<int> dicesValueList = [];
  for (int dice in diceList) {
    int randomNumber = random.nextInt(dice) + 1;
    stdout.writeln('\n Rolling a $dice sided die: $randomNumber');
    dicesValueList.add(randomNumber);
  }
  return dicesValueList;
}

List<int> diceThrower(List<String> arguments) {
  // check if arguments are integers
  final List<int> diceList = inputChecker(arguments);
  if (diceList.isEmpty) {
    return diceList;
  }
  // if we reach here, then we have valid arguments
  return randomizer(diceList);
}
