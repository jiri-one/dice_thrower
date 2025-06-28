import 'dart:io';
import 'dart:math' show Random;

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
