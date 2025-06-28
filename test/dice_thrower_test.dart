import 'package:dice_thrower/dice_thrower.dart' show inputChecker, randomizer;
import 'package:test/test.dart';

void main() {
  test('test inputChecker', () {
    final intInString = inputChecker(["1"]);
    final intInStringExpected = [];
    final string = inputChecker(["string"]);
    final stringExpected = [];
    final empty = inputChecker([]);
    final emptyExpected = [];
    final negative = inputChecker(["-1"]);
    final negativeExpected = [];
    final zero = inputChecker(["0"]);
    final zeroExpected = [];
    final dices = inputChecker(["2", "3", "20"]);
    final dicesExpected = [2, 3, 20];
    final results = [intInString, string, empty, negative, zero, dices];
    final expectedResults = [
      intInStringExpected,
      stringExpected,
      emptyExpected,
      negativeExpected,
      zeroExpected,
      dicesExpected,
    ];
    // check if all results are equal to expected results
    for (int i = 0; i < results.length; i++) {
      expect(results[i], expectedResults[i]);
    }
  });
  test("test randomizer with good inputs", () {
    // check if randomizer is working
    final random = randomizer([2, 3, 20]);
    expect(random, isNotNull);
    expect(random[0], isIn([1, 2]));
    expect(random[1], isIn([1, 2, 3]));
    expect(random[2], (int value) => value >= 1 && value <= 20);
    expect(random.length, 3);
  });
  test("test randomizer with empty list", () {
    // check if randomizer is working
    final random = randomizer([]);
    expect(random, []);
  });
}
