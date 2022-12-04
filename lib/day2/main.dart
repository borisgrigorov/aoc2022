import 'dart:io';

void main(List<String> args) {
  List<List<String>> input = loadFile('lib/day2/input.txt');
  int totalScore = 0;
  for (final x in input) {
    totalScore += getScore(x);
  }
  print("Total score: $totalScore");
}

enum Symbol {
  rock,
  paper,
  scissors,
}

enum Result {
  win,
  lose,
  draw,
}

int getScore(List<String> input) {
  int score = 0;
  Symbol me = getSymbolFromChar(input[1]);
  Symbol opponent = getSymbolFromChar(input[0]);
  Result win = isWinner(me, opponent);

  if (me == Symbol.rock) {
    score += 1;
  } else if (me == Symbol.paper) {
    score += 2;
  } else if (me == Symbol.scissors) {
    score += 3;
  }
  if (win == Result.win) {
    score += 6;
  } else if (win == Result.draw) {
    score += 3;
  }
  return score;
}

Result isWinner(Symbol me, Symbol opponent) {
  if (me == opponent) {
    return Result.draw;
  }
  if (me == Symbol.rock && opponent == Symbol.scissors) {
    return Result.win;
  } else if (me == Symbol.paper && opponent == Symbol.rock) {
    return Result.win;
  } else if (me == Symbol.scissors && opponent == Symbol.paper) {
    return Result.win;
  } else {
    return Result.lose;
  }
}

Symbol getSymbolFromChar(String char) {
  if (char == "A" || char == "X") {
    return Symbol.rock;
  } else if (char == "B" || char == "Y") {
    return Symbol.paper;
  } else {
    return Symbol.scissors;
  }
}

List<List<String>> loadFile(String fileName) {
  List<List<String>> input = [];
  File file = File(fileName);
  file.readAsLinesSync().forEach((line) {
    if (line.trim().isNotEmpty) {
      List<String> split = line.split(' ');
      input.add([split[0], split[1]]);
    }
  });
  return input;
}
