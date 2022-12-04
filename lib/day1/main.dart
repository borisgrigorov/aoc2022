import 'dart:io';

void main(List<String> args) {
  List<int> input = [];
  input = loadFile('input.txt');

  input.sort((a, b) => b.compareTo(a));
  int totalTopThree = input[0] + input[1] + input[2];
  print(totalTopThree);
}

List<int> loadFile(String fileName) {
  List<int> input = [];
  File file = File(fileName);
  int i = 0;
  file.readAsLinesSync().forEach((line) {
    if (line.trim().isNotEmpty) {
      i += int.parse(line);
    } else {
      input.add(i);
      i = 0;
    }
  });
  return input;
}

int getTopThree(List<int> input) {
  input.sort((a, b) => b.compareTo(a));
  return input[0] + input[1] + input[2];
}
