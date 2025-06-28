import 'dart:io';
import 'package:args/args.dart' show ArgParser, ArgResults;
import 'package:dice_thrower/dice_thrower.dart';

void main(List<String> arguments) {
  // if no arguments provided then exit
  if (arguments.isEmpty) {
    print('No arguments provided.');
    exitCode = 0;
    return;
  }
  // so we have arguments, lets work with them
  final parser =
      ArgParser()
        ..addFlag(
          "help",
          negatable: false,
          abbr: 'h',
          help: 'Show this help message',
        )
        ..addFlag(
          "version",
          negatable: false,
          abbr: 'v',
          help: 'Show version information',
        );
  final ArgResults arg = parser.parse(arguments);
  if (arg.arguments.contains("-h") || arg.arguments.contains("--help")) {
    stdout.writeln('Usage:\ndice_thrower dice/s\ndice_thrower [options]\n');
    stdout.writeln(
      "Dice/s are numbers that represent the number of faces on the die. If you want more dice, separate each die with a space.\n",
    );
    stdout.writeln('Options:');
    stdout.writeln('  -h, --help     Show this help message');
    stdout.writeln('  -v, --version  Show version information');
    stdout.writeln("\n");
  }

  if (arg.arguments.contains("-v") || arg.arguments.contains("--version")) {
    stdout.writeln('dice_thrower version 0.0.1');
    stdout.writeln("\n");
  }

  final argumentsList = arg.rest;
  diceThrower(argumentsList);
  exitCode = 0;
  return;
}
