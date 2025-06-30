import 'dart:math' show Random;

Random random = Random();

List<int> inputChecker(List<String> arguments) {
  // check if arguments are integers
  for (var dice in arguments) {
    // check if dice is a number
    if (int.tryParse(dice) == null) {
      print('Invalid argument: $dice');
      print('Please provide a list of integers.');
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
      return [];
    }
  }
  return diceList;
}

Future<int> oneDiceThrower(int dice) async {
  int randomNumber = random.nextInt(dice) + 1;
  print('\n Rolling a $dice sided die: $randomNumber');
  return randomNumber;
}

Future<List<int>> randomizer(List<int> diceList) async {
  // if we reach here, then we have valid arguments
  List<int> dicesValueList = [];
  // one possibility is to use a stream to iterate over the diceList
  // and call the oneDiceThrower function for each dice

  // Stream<int> stream = Stream.fromIterable(diceList);
  // await for (int dice in stream) {
  //   int rolledNumber = await oneDiceThrower(dice);
  //   print('\n Rolling a $dice sided die: $rolledNumber');
  //   dicesValueList.add(rolledNumber);
  // }

  // but we can also use Future.wait to call the oneDiceThrower function for each dice
  // and wait for all the futures to complete
  await Future.wait(
    diceList.map((int dice) async {
      int rolledNumber = await oneDiceThrower(dice);
      dicesValueList.add(rolledNumber);
    }),
  );
  // return the list of random dice values
  return dicesValueList;
}

Future<List<int>> diceThrower(List<String> arguments) async {
  // check if arguments are integers
  final List<int> diceList = inputChecker(arguments);
  if (diceList.isEmpty) {
    return diceList; // return empty list if input is invalid
  }
  // if we reach here, then we have valid arguments
  return randomizer(diceList);
}
