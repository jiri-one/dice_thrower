import '../bin/dice_thrower.dart' show inputChecker;
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
    final results = [
      intInString,
      string,
      empty,
      negative,
      zero,
      dices
    ];
    final expectedResults = [
      intInStringExpected,
      stringExpected,
      emptyExpected,
      negativeExpected,
      zeroExpected,
      dicesExpected
    ];
    // check if all results are equal to expected results
    for (int i = 0; i < results.length; i++) {
      expect(results[i], expectedResults[i]);
    }
  });
}
